provider "aws" {
  region = var.region
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "vm-1" {
  ami                         = "ami-052b3645c2c811821"
  instance_type               = "t3.small"
  subnet_id                   = aws_subnet.my-subnet.id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]
  key_name                    = aws_key_pair.my-key.key_name
  associate_public_ip_address = true
  user_data                   = file("install_nginx.sh")
  tags = {
    Name = "vm-1"
  }
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my-subnet"
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "my-rt"
  }
}

resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table_association" "my-rt-association" {
  subnet_id      = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.my-rt.id
}