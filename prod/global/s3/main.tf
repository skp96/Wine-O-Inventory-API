terraform {
    required_version = ">= 0.12, < 0.13"

    backend "s3" {
        bucket = "wine-o-inventory-tf-state"
        key = "global/s3/terraform.tfstate"
        region = "us-east-2"

        dynamodb_table = "wine-o-inventory-tf-state-locks"
        encrypt = true
    }
}

provider "aws" {
    region = "us-east-2"
    version = "~> 2.0"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "wine-o-inventory-tf-state"

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

resource "aws_dynamodb_table" "terraform-locks" {
    name = "wine-o-inventory-tf-state-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
