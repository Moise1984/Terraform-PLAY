module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"


  name = "moise-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  enable_nat_gateway     = var.vpc_enable_nat_gateway
  single_nat_gateway     = var.vpc_single_nat_gateway
  one_nat_gateway_per_az = var.vpc_one_nat_gateway_per_az

  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  database_subnet_tags = {
    Type = "database-subnets"
  }
  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  tags = {
    Owner       = "moise"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "moise-vpc"
  }
}

