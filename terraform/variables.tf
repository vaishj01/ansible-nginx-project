variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "AWS Key Pair"
  type        = string
}

variable "control_node_name" {
  description = "Control Node Name"
  type        = string
}

variable "web_server_name" {
  description = "Web Server Name"
  type        = string
}

variable "security_group_name" {
  description = "Security Group Name"
  type        = string
}

variable "ssh_port" {
  description = "SSH Port"
  type        = number
}

variable "http_port" {
  description = "HTTP Port"
  type        = number
}