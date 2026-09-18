variable "project_name" {
  type    = string
  default = "aws-devops-portfolio"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "availability_zone_1a" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone_1b" {
  type    = string
  default = "us-east-1b"
}