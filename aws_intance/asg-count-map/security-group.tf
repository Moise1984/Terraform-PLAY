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
