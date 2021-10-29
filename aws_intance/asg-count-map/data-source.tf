data "aws_ami" "linux_2" {        #come back
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"] # Canonical
}
