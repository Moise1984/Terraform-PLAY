resource "aws_instance" "moise-pub" {      #come back
  ami           = data.aws_ami.linux_2.id
  instance_type = var.instance_type_list[0]
  associate_public_ip_address = true
  key_name  =  var.instance_key_pair
  subnet_id = aws_subnet.moise-pub.id
  security_groups =   [aws_security_group.moise.id]
  tags = {
    Name = "production"
  }
}


resource "aws_instance" "moise-priv" {      #come back
  ami           =   data.aws_ami.linux_2.id 
  key_name  =  var.instance_key_pair
  instance_type = var.instance_type_list[2]
  subnet_id = aws_subnet.moise-priv.id
  security_groups =   [aws_security_group.moise.id]
  tags = {
    Name = "administration"
  }
}
