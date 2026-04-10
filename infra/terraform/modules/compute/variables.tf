variable "name" {
  description = "Project/environment name prefix"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = ""
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into the instance"
  type        = string
}

