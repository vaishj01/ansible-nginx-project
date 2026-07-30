output "cluster_name" {
  description = "Amazon EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Amazon EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "region" {
  description = "AWS Region"
  value       = var.aws_region
}