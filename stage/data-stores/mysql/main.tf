provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "jms-terraform-shared-state"
    key     = "stage/data-stores/mysql/terraform.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}

module "rds_instance" {
  source = "../../../modules/data-stores/mysql"

  rds_instance_name = "mysqlstage"
  rds_db_name       = "mysqlstage"
  db_password       = "VMware1!"
}

output "address" {
  value = "${module.rds_instance.address}"
}

output "port" {
  value = "${module.rds_instance.port}"
}
