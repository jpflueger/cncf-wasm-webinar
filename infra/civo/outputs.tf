output "kubeconfig" {
  value       = civo_kubernetes_cluster.main.kubeconfig
  description = "kubeconfig for created cluster"
  sensitive   = true
}