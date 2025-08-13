variable "kms_key_arn" {
  type        = string
  description = "Optional KMS Key ID used for session encryption. If not provided, a KMS key is generated."
  default     = null
}

variable "name" {
  type        = string
  description = "Name to be used by policy"
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "Optionally create a unique name beginning with the specified prefix"
  default     = null
}

variable "role_name" {
  type        = string
  description = "Role to create new policy for"
}
