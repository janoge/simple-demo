/* core variables, mostly setup in jenkins file */
variable "region_from" {
  description = "Region that the instances will be created"
}

variable "region" {
  description = "Region that the instances will be created"
}

variable "aws_account_number" {
  description = "The aws account number"
}

variable "environment" {
  description = "Environment that the instances will be created"
}

