resource "aws_instance" "db" {
  ami                       = var.ami_id
  instance_type             = var.instance_type
  vpc_security_group_ids    = [var.security_group_id]
  subnet_id                 = var.public_subnet_id
  key_name                  = "se-colinwood"
  tags = {
    Name = "cew_working_node"
  }

  
  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}