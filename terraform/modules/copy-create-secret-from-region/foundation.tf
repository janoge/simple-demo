/*provider "aws" {
  alias = "from"
  region = "${var.m_region_from}"
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
  assume_role {
      role_arn = "arn:aws:iam::${var.m_aws_account_number}:role/CrossAccountRole"
  }
}

provider "aws" {
  alias = "to"
  region = "${var.m_region}"
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
  assume_role {
      role_arn = "arn:aws:iam::${var.m_aws_account_number}:role/CrossAccountRole"
  }
}
 just for local testing*/
provider "aws" {
  alias = "from"
  region                  = "${var.m_region_from}"
  shared_credentials_file = "/Users/jage/.aws/credentials"
  profile                 = "pg"
}
provider "aws" {
  alias = "to"
  region                  = "${var.m_region}"
  shared_credentials_file = "/Users/jage/.aws/credentials"
  profile                 = "pg"
}