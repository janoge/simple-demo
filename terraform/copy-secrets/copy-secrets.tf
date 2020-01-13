//store secrets to be copied to new region
variable "list_of_Secrets" {
  default = [
    "hub/uaa/smartbuildings_app",
    "hub/uaa/smartbuildings_frontend_web",
    "hub/uaa/siemens-id"
  ]
  description = "The list of secrets to be copied from region_from to region"
}

//Module doesn't support count, will be introduced in 0.12 vertion
//TODO check in 0.12 how to use it

 module "demo-copy-secrets" {
  source               = "../modules/copy-create-secret-from-region"
  m_region_from        = "${var.region_from}"
  m_region             = "${var.region}"
  m_secret_name = "hub/uaa/smartbuildings_app"
  m_aws_account_number = "${var.aws_account_number}"

}

