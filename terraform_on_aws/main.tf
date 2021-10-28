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



resource "aws_subnet" "moise-pub" {
  vpc_id     = aws_vpc.moise.id
  cidr_block = "10.0.0.0/24"
  availability_zone = var.az_number

  tags = {
    Name = "terra-pub-sub1"
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

resource "aws_route_table_association" "moise-pub" {
  subnet_id      = aws_subnet.moise-pub.id
  route_table_id = aws_route_table.moise-pub.id
}

resource "aws_route_table_association" "moise-priv" {
  subnet_id      = aws_subnet.moise-priv.id
  route_table_id = aws_route_table.moise-priv.id
}

