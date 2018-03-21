provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "jms-terraform-shared-state"
    key     = "prod/data-stores/mysql/terraform.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}

module "rds_instance" {
  source = "../../../modules/data-stores/mysql"

  rds_instance_name = "mysql-prod"
}
