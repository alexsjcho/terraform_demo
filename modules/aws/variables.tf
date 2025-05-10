variable "instance_type" {
  description = "AWS EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AWS AMI ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
} 