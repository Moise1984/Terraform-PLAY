module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 2 required variables here

   name        = "SG-bastion"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = var.vpc_cidr_block
    },
  ]
 }


