module "ec2-instance2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.0.0"
  # insert the 4 required variables here
  #for_each = { 
   # key1 = var.vpc_private_subnets[1]
   # key2 = var.vpc_private_subnets[0] 
   # }                           #toset(["one", "two"])
  name     = "my-instance-priv"
  count = var.instance_count

  ami                    = data.aws_ami.linux_2.id     #good
  instance_type          = var.instance_type_map["qa"] #good
  key_name               = var.instance_key_pair       #good
  monitoring             = var.ec2_monitoring          #good
  vpc_security_group_ids = [module.security-group2.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, count.index)
  user_data              = file("apache.sh")
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}