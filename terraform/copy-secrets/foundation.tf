/*
provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
  assume_role {
      role_arn = "arn:aws:iam::${var.aws_account_number}:role/CrossAccountRole"
  }
}
just for local testing */

provider "aws" {
  region                  = var.m_region
  shared_credentials_file = "/Users/jage/.aws/credentials"
  profile                 = "pg"
}

