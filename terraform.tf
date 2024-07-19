terraform {
  required_version = "~> 1.5"

  backend "s3" {
    bucket         = "terraform-module-template"
    key            = "state/terraform.tfstate"
    dynamodb_table = "terraform-module-template"
    region         = "eu-west-1"
    max_retries    = 3
    session_name   = "terraform-module-template"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58"
    }
  }
}

provider "aws" {
  region = "eu-west-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:${var.deployment_role}"
    session_name = "terraform-module-template"
  }
}
