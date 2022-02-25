terraform {
    required_version = ">= 0.12, < 0.13"
}

provider "aws" {
    region = "us-east-2"
    version = "~> 2.0"
}

resource "aws_instance" "web" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    associate_public_ip_address = true
    key_name = "deployer_key"

    user_data = file("prod_setup.sh")

    tags = {
        Name = "wine-o-inventory"
    }
}

resource "aws_security_group" "instance" {
    name = "wine_o_inventory_security_group"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "deployer" {
    key_name = "deployer_key"
    public_key = var.aws_deployer_key
}

