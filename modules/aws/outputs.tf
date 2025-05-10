output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.instance.id
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.instance.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.instance.public_ip
} 