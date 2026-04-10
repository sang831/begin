variable "aws_region" {
  type = string

  validation {
    condition     = trimspace(var.aws_region) != ""
    error_message = "aws_region must not be empty (example: ap-southeast-1)."
  }
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "begin"
}

