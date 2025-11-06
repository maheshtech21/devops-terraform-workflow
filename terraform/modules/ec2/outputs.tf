output "sshhost_public_ip" { value = aws_instance.sshhost.public_ip }
output "app_private_ip" { value = aws_instance.app.private_ip }
output "app_instance_id" {  value       = aws_instance.app.id }
