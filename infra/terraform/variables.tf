variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "cluster_name" {
  description = "Amazon EKS Cluster Name"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "ecr_repository" {
  description = "Amazon ECR repository name"
  type        = string
}

variable "secret_name" {
  description = "AWS Secrets Manager secret name"
  type        = string
}