variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "secret_name" {
  description = "AWS Secrets Manager secret name"
  type        = string
}