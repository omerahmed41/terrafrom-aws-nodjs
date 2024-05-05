# Data source: query the list of availability zones
data "aws_availability_zones" "all" {}

resource "local_file" "docker_setup_script" {
  filename = "${path.module}/run_docker.sh"
  content = <<-EOT
    #!/bin/bash

    # Install Docker
    snap install docker
    sudo usermod -aG docker $USER
    sudo systemctl start docker

    # Wait for Docker to start
    until sudo docker info >/dev/null 2>&1; do
      echo "Waiting for Docker to start..."
      sleep 1
    done

    # Run Docker container
    sudo docker run --platform linux/amd64 -d -p 3000:3000 omerahmed41/energy-app:latest
    sudo docker ps >> /home/ubuntu/log.txt 2>&1
  EOT
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami                    = "ami-0776c814353b4814d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  associate_public_ip_address = true
  user_data              = local_file.docker_setup_script.content

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # CIDR block for the VPC
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}


