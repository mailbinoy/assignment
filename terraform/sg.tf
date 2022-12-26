
resource "aws_security_group" "Bastion_SG" {
  name        = "Bastion_SG"
  description = "Security Group for Bastion Host"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Allow Port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${chomp(data.http.myip.response_body)}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_22"
  }
}



resource "aws_security_group" "Private_SG" {
  name        = "Private_SG"
  description = "Security Group for Private Subnet"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Allow incoming traffic from VPC"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG_Private_Subnet"
  }
}


resource "aws_security_group" "Public_SG" {
  name        = "Public_SG"
  description = "Security Group for Public Subnet"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Allow incoming traffic to port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${chomp(data.http.myip.response_body)}/32"]
  }

  ingress {
    description      = "Allow incoming traffic to port 80 from my desktop"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${var.desktop_ip}/32"]
  }
  ingress {
    description      = "Allow incoming traffic from VPC"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG_Public_Subnet"
  }
}
