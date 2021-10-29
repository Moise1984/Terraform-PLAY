resource "aws_instance" "moise-pub" {      #come back
  ami           = data.aws_ami.linux_2.id
  instance_type = var.instance_type_map["qa"]
  associate_public_ip_address = true
  key_name  =  var.instance_key_pair
  subnet_id = aws_subnet.moise-pub.id
  security_groups =   [aws_security_group.moise.id]
  count = 2
  tags = {
    Name = "production-${var.instance_name}-${count.index}"
  }
}


resource "aws_instance" "moise-priv" {      #come back
  ami           =   data.aws_ami.linux_2.id 
  key_name  =  var.instance_key_pair
  instance_type = var.instance_type_map["qa"]
  subnet_id = aws_subnet.moise-priv.id
  security_groups =   [aws_security_group.moise.id]
  count = 2
  tags = {
    Name = "administration-${var.instance_name}-${count.index}"
  }
}
