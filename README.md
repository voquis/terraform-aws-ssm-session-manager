SSM Session Manager
===
Terraform module to create the policies for an instance to be able to run session manager.

# Examples
## Minimal with fixed name
```terraform
provider "aws" {
  version = "3.4.0"
  region  = "eu-west-2"
}

module "s3" {
  source  = "voquis/ssm-session-manager/aws"
  version = "0.0.1"

  kms_key_arn = aws_kms_key.my_kms.arn
  name        = "my_ssm_session_manager"
  role_name   = aws_iam_role.my_role.name
}
```
