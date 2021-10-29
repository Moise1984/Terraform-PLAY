# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
resource "aws_vpc" "moise" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "terra-vpc"
  }
}

resource "aws_internet_gateway" "moise" {
  vpc_id = aws_vpc.moise.id

  tags = {
    Name = "terra-igw"
  }
}



resource "aws_subnet" "moise-pub1" {
  vpc_id     = aws_vpc.moise.id
  cidr_block = "10.0.0.0/24"
  availability_zone = var.az_number

  tags = {
    Name = "terra-pub-sub1"
  }
}


resource "aws_subnet" "moise-pub2" {
  vpc_id     = aws_vpc.moise.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "terra-pub-sub2"
  }
}

resource "aws_subnet" "moise-priv" {
  vpc_id     = aws_vpc.moise.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.az_number

  tags = {
    Name = "terra-priv-sub1"
  }
}


resource "aws_route_table" "moise-pub" {
  vpc_id = aws_vpc.moise.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.moise.id
    }
    

  tags = {
    Name = "rtb-pub"
  }
}

resource "aws_route_table" "moise-priv" {
  vpc_id = aws_vpc.moise.id
 
  tags = {
    Name = "rtb-priv"
  }
}

resource "aws_route_table_association" "moise-pub1" {
  subnet_id      = aws_subnet.moise-pub1.id
  route_table_id = aws_route_table.moise-pub.id
}

resource "aws_route_table_association" "moise-pub2" {
  subnet_id      = aws_subnet.moise-pub2.id
  route_table_id = aws_route_table.moise-pub.id
}

resource "aws_route_table_association" "moise-priv" {
  subnet_id      = aws_subnet.moise-priv.id
  route_table_id = aws_route_table.moise-priv.id
}




resource "aws_autoscaling_group" "Asg-moise" {
  name                      = "qa-test- Asg"
  max_size                  = 4
  min_size                  = 1
  desired_capacity          = 2
  launch_configuration      = aws_launch_configuration.web_config.name
  vpc_zone_identifier       = [aws_subnet.moise-pub1.id, aws_subnet.moise-pub2.id]
}

resource "aws_launch_configuration" "web_config" {
  name          = "web_config"
  image_id      = data.aws_ami.linux_2.id
  instance_type = var.instance_type_map["qa"]
  associate_public_ip_address = true
  key_name  =  var.instance_key_pair
  security_groups =  [aws_security_group.moise.id]
  user_data = file("apache.sh") 
}

resource "aws_security_group" "moise" {
  name        = "allow_http"
  description = "Allow port 80 inbound traffic"
  vpc_id      = aws_vpc.moise.id

  ingress  {
      description      = "http from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp" 
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress  {
      description      = "ssh from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["68.33.90.83/32"] 
    }
  

  egress  {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  
  tags = {
    Name = "terra-web-sg"
  }
}

data "aws_ami" "linux_2" {        #come back
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"] # Canonical
}
