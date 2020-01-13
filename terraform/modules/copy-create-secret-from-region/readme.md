## copy-create-secret-from-region
# This module will copy and create existing SecretManager secrets from one region to another.
# (Secrets must not exist in the new region because will be created.)

Terraform state file will not be store to S3.
Goal of this module is avoid errors/typos during manual steps.


## Inputs 
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| m_region_from | The source region | string | no | yes |
| m_region | Target region | string | no | yes |
| m_secret_name | The secret name in secretmanager | string | no | yes |
| m_aws_account_number | The account number | string | no | yes |

## Usage
```hcl
module "demo-copy-secret" {
  source = "../../modules/secret-data/copy-secret-from-region"
  m_region_from = "${var.region_from}"
  m_region      = "${var.region}"
  m_secret_name = "hub/uaa/uaa_token_signing_key"
  m_aws_account_number= "${var.aws_account_number}"
}
```
please take care about source module path. 
