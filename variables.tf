variable "kms_key_arn" {
  type        = string
  description = "KMS Key ID used for session encryption"
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
