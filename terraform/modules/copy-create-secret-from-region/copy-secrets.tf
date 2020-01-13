/* Read secretmanager secret version from source region */
data "aws_secretsmanager_secret_version" "tf-get-secret-version" {
  provider = "aws.from"
  secret_id = "${var.m_secret_name}"
}
/* get secretmanager secret from source region*/
data "aws_secretsmanager_secret" "tf-get-secret" {
  provider = "aws.from"
  name = "${var.m_secret_name}"
}

/* Create secret manager secret in target region */
resource "aws_secretsmanager_secret" "tf-secret-create" {
    provider = "aws.to"
    name = "${var.m_secret_name}"
    description = "${data.aws_secretsmanager_secret.tf-get-secret.description}"
}
/* Copy secret from source region to target region */
resource "aws_secretsmanager_secret_version" "tf-copy-secret-value" {
  provider = "aws.to"
  secret_id      = "${aws_secretsmanager_secret.tf-secret-create.id}"
  secret_string  = "${data.aws_secretsmanager_secret_version.tf-get-secret-version.secret_string}"
}