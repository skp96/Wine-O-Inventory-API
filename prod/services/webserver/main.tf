terraform {
    required_version = ">= 0.12, < 0.13"
}

provider "aws" {
    region = "us-east-2"
    version = "~> 2.0"
}

resource "aws_instance" "web" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.small"
    vpc_security_group_ids = [aws_security_group.web.id]
    key_name = "AWS EC2 - Wine-O-Inventory"

    user_data = data.template_file.user_data.rendered

    tags = {
        Name = "wine-o-inventory"
    }
}

resource "aws_security_group" "web" {
    name = "wine_o_inventory_security_group_web"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

data "terraform_remote_state" "db" {
    backend = "s3"

    config = {
        bucket = "wine-o-inventory-tf-state"
        key = "data-stores/postgres/terraform.tfstate"
        region = "us-east-2"
    }
}

data "template_file" "user_data" {
    template = file("prod_setup.sh")

    vars = {
        db_address = data.terraform_remote_state.db.outputs.address
        db_port = data.terraform_remote_state.db.outputs.port
        db_name = data.terraform_remote_state.db.outputs.name
        db_username = var.username
        db_password = var.password
    }
}
