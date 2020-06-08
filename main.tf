resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key
  count         = 3

  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("script.sh")
  tags = {
    Name = "terraform-webserver2"
  }
}
resource "aws_security_group" "sg" {
  name = "terraform-example-sg"

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

  tags = {
    Name = "terraform-sg"
  }
}



