output "s3_bucket_name" { value = aws_s3_bucket.app_bucket.bucket }
output "iam_instance_profile" { value = aws_iam_instance_profile.ec2_profile.name }
