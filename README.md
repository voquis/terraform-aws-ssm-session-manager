SSM Session Manager
===
Terraform module to create the policies for an instance to be able to run session manager.

# Examples
## Minimal with fixed name
This example will create a KMS key.

```terraform
module "ssm" {
  source  = "voquis/ssm-session-manager/aws"
  version = "1.0.0"

  name        = "my_ssm_session_manager"
  role_name   = aws_iam_role.my_role.name
}
```

## Own KMS key

```terraform
# KMS key
resource "aws_kms_key" "example" {
  description              = "SSM Session Manager"
  deletion_window_in_days  = 10
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
}

#
module "ssm" {
  source  = "voquis/ssm-session-manager/aws"
  version = "1.0.0"

  kms_key_arn = aws_kms_key.example.arn
  name        = "my_ssm_session_manager"
  role_name   = aws_iam_role.my_role.name
}
```
