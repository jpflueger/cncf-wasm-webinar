# Create a network
resource "civo_network" "main" {
  label = var.name
}

# Create a firewall
resource "civo_firewall" "main" {
  name       = var.name
  network_id = civo_network.main.id

  create_default_rules = true

  ingress_rule {
    action     = "allow"
    cidr       = var.allowed_api_cidrs
    label      = "kubernetes-api-server"
    port_range = "6443"
  }
}

# Create a cluster with k3s
resource "civo_kubernetes_cluster" "main" {
  name         = var.name
  cluster_type = "k3s"

  cni         = var.cni
  network_id  = civo_network.main.id
  firewall_id = civo_firewall.main.id

  pools {
    label      = "default"
    size       = var.node_size
    node_count = var.node_count
  }
}
