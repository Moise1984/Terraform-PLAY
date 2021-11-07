module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.0.0"
  # insert the 4 required variables here


  name           = "my-instance-bastion"
  instance_count = 1

  ami                    = data.aws_ami.linux_2.id     #good
  instance_type          = var.instance_type_map["qa"] #good
  key_name               = var.instance_key_pair       #good
  monitoring             = var.ec2_monitoring          #good
  vpc_security_group_ids = [module.security-group.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[1] #good


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}