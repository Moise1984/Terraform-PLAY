module "security-group2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0.0"
  # insert the 2 required variables here


  name        = "SG-PRIV"
  description = "Security group for"
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
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = var.vpc_cidr_block
    },
  ] 
}