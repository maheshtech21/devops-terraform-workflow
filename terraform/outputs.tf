output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public Subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private Subnet IDs"
  value       = module.vpc.private_subnets
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.s3_iam.s3_bucket_name
}

output "iam_instance_profile" {
  description = "IAM instance profile for app EC2"
  value       = module.s3_iam.iam_instance_profile
}

output "sshhost_public_ip" {
  description = "Public IP of SSH host EC2"
  value       = module.ec2.sshhost_public_ip
}

output "app_private_ip" {
  description = "Private IP of app EC2"
  value       = module.ec2.app_private_ip
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.alb_dns_name
}

output "public_sg_id" {
  description = "Public security group ID"
  value       = module.security_groups.public_sg_id
}

output "app_sg_id" {
  description = "App security group ID"
  value       = module.security_groups.app_sg_id
}
