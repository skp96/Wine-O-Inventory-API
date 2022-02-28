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
    identifier_prefix = "wine-o-inventory"
    engine = "postgres"
    allocated_storage = 10
    instance_class = "db.t3.micro"
    name = "wine_o_inventory_database"
    username = var.db_username
    password = var.db_password
}
