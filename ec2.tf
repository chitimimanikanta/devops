resource "aws_instance" "ec2_terraform" {
  ami           = "ami-01edba92f9036f76e" # Example Amazon Linux 2 AMI (Mumbai region)
  instance_type = "t3.micro"              # Free-tier eligible
  vpc_security_group_ids  = [aws_security_group.allow_everything.id]

  tags = {
    Name = "Terraform-EC2"
  }
}

resource "aws_security_group" "allow_everything" {
  name   = "allow_everything"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_everything"
  }

}
