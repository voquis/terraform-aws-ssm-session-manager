output "iam_policy" {
  value = aws_iam_policy.ssm_session_manager
}

output "iam_role_policy_attachment" {
  value = aws_iam_role_policy_attachment.ssm_session_manager
}
