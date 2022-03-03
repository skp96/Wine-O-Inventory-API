terraform {
    required_version = ">= 0.12, < 0.13"

    backend "s3" {
        bucket = "wine-o-inventory-tf-state"
        key = "data-stores/postgres/terraform.tfstate"
        region = "us-east-2"

        dynamodb_table = "wine-o-inventory-tf-state-locks"
        encrypt = true
    }
}

provider "aws" {
    region = "us-east-2"
    version = "~> 2.0"
}

resource "aws_db_instance" "wine_o_inventory_db" {
    identifier_prefix = "postgres-db"
    engine = "postgres"
    allocated_storage = 10
    instance_class = "db.t3.micro"
    name = "wine_o_inventory_database"
    username = var.db_username
    password = var.db_password
    publicly_accessible = true
    skip_final_snapshot  = true
    vpc_security_group_ids = [aws_security_group.db.id]
}

resource "aws_security_group" "db" {
    name = "postgres_db_connect_security_group"

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
