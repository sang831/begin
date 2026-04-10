variable "aws_region" {
  type = string
}

variable "name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
  default = ""
}

variable "allowed_ssh_cidr" {
  type = string
}

