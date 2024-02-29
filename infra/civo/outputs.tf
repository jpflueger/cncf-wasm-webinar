output "kubeconfig" {
  value       = civo_kubernetes_cluster.main.kubeconfig
  description = "kubeconfig for created cluster"
  sensitive   = true
}

output "cluster_domain" {
  value = civo_kubernetes_cluster.main.dns_entry
}

output "lb_domain" {
  value = "${data.civo_loadbalancer.main.id}.lb.civo.com"
}
