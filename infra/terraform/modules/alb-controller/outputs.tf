output "alb_controller_service_account" {
  description = "Name of the Kubernetes service account used by ALB Controller"
  value       = kubernetes_service_account.alb_controller.metadata[0].name
}

output "alb_controller_helm_release_status" {
  description = "Status of the ALB Controller Helm release"
  value       = helm_release.alb_controller.status
}
