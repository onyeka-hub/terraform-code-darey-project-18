# This section will create the subnet group for the RDS  instance using the private subnet
resource "aws_db_subnet_group" "onyi-rds" {
  name       = "onyi-rds"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {
      Name = format("%s-%s", var.name, "rds")
    },
  )
}

# create the RDS instance with the subnets group
resource "aws_db_instance" "onyi-rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  db_name                = var.db_name
  username               = var.master-username
  password               = var.master-password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.onyi-rds.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
  multi_az               = var.multi_az
  identifier             = var.identifier
}