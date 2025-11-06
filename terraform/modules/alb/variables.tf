variable "project_name" { type = string }
variable "vpc_id" { type = string }
variable "public_subnets" { type = list(string) }
variable "app_instance_id" { type = string }
variable "app_sg_id" { type = string }
