# # #############################################
# # ##creating bucket and dynamodb for s3 backend
# # #############################################

# resource "aws_s3_bucket" "terraform-state" {
#   bucket        = "onyeka-terraform-state"
#   force_destroy = true
# }
# resource "aws_s3_bucket_versioning" "version" {
#   bucket = aws_s3_bucket.terraform-state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
# resource "aws_s3_bucket_server_side_encryption_configuration" "first" {
#   bucket = aws_s3_bucket.terraform-state.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
##################################################################


# module for creating the vpc
module "vpc" {
  source                              = "./modules/vpc"
  name                                = var.name
  max_subnets                         = var.max_subnets
  environment                         = var.environment
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 6, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
  name   = var.name
}


# RDS module; this module will create the RDS instance in the private subnet
module "rds" {
  source                 = "./modules/rds"
  subnet_ids             = [module.vpc.private_subnets-2, module.vpc.private_subnets-3]
  master-username        = var.master-username
  master-password        = var.master-password
  vpc_security_group_ids = module.security.vpc_security_group_ids
  multi_az               = var.multi_az
  name                   = var.name
  identifier             = var.identifier
  db_name                = var.db_name
}


# Module for Elastic Filesystem; this module will creat elastic file system in the webservers availablity
# zone and allow traffic fro the webservers

module "efs" {
  source       = "./modules/efs"
  account_no   = var.account_no
  user         = var.user
  name         = var.name
  efs-subnet-1 = module.vpc.private_subnets-1
  efs-subnet-2 = module.vpc.private_subnets-2
  efs-sg       = [module.security.vpc_security_group_ids]
}

module "AutoScaling" {
  source            = "./modules/Autoscaling"
  name              = var.name
  ami-web           = var.ami-web
  ami-bastion       = var.ami-bastion
  ami-nginx         = var.ami-nginx
  desired_capacity  = var.desired_capacity
  min_size          = var.min_size
  max_size          = var.max_size
  web-sg            = [module.security.web-sg]
  bastion-sg        = [module.security.bastion-sg]
  nginx-sg          = [module.security.nginx-sg]
  wordpress-alb-tgt = module.alb.wordpress-tgt
  nginx-alb-tgt     = module.alb.nginx-tgt
  tooling-alb-tgt   = module.alb.tooling-tgt
  instance_profile  = module.vpc.instance_profile
  public_subnets    = [module.vpc.public_subnets-1, module.vpc.public_subnets-2]
  private_subnets   = [module.vpc.private_subnets-1, module.vpc.private_subnets-2]
  keypair           = var.keypair
}

# Module for Application Load balancer, this will create Extenal Load balancer and internal load balance
module "alb" {
  source             = "./modules/alb"
  name               = var.name
  vpc_id             = module.vpc.vpc_id
  public-sg          = module.security.public-sg
  private-sg         = module.security.private-sg
  public-sbn-1       = module.vpc.public_subnets-1
  public-sbn-2       = module.vpc.public_subnets-2
  private-sbn-1      = module.vpc.private_subnets-1
  private-sbn-2      = module.vpc.private_subnets-2
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
}

# The Module creates instances for jenkins, sonarqube abd jfrog
# module "compute" {
#   source          = "./modules/compute"
#   ami-jenkins     = var.ami
#   ami-sonar       = var.ami
#   ami-jfrog       = var.ami
#   subnets-compute = module.vpc.public_subnets-1
#   sg-compute      = [module.security.public-sg]
#   keypair         = var.keypair
#   name            = var.name
# }
