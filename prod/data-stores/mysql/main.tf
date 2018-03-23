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

  rds_instance_name = "mysqlprod"
  rds_db_name       = "mysqlprod"
  db_password       = "VMware1!"
}

output "address" {
  value = "${module.rds_instance.address}"
}

output "port" {
  value = "${module.rds_instance.port}"
}
