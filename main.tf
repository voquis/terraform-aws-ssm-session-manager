#
# SSM Session manager for remote console sessions without SSH
# https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-add-permissions-to-existing-profile.html
#

resource "aws_iam_policy" "ssm_session_manager" {
  name        = var.name
  name_prefix = var.name_prefix
  policy      = data.aws_iam_policy_document.ssm_session_manager.json
}

data "aws_iam_policy_document" "ssm_session_manager" {
  statement {
    actions = [
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "s3:GetEncryptionConfiguration",
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "kms:Decrypt",
    ]
    resources = [
      var.kms_key_arn
    ]
  }
}

# Attach ssm policy to role assumed by EC2 instance
resource "aws_iam_role_policy_attachment" "ssm_session_manager" {
  role       = var.role_name
  policy_arn = aws_iam_policy.ssm_session_manager.arn
}
