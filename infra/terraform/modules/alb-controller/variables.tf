variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "alb_controller_role_arn" {
  description = "IAM role ARN for the AWS Load Balancer Controller (IRSA)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster is deployed"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
