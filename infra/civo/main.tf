# Create a network
resource "civo_network" "main" {
  label = var.name
}

# Create a firewall
resource "civo_firewall" "main" {
  name       = var.name
  network_id = civo_network.main.id

  create_default_rules = false

  ingress_rule {
    label      = "6443 port(s) open"
    action     = "allow"
    protocol   = "tcp"
    cidr       = var.allowed_api_cidrs
    port_range = "6443"
  }

  ingress_rule {
    label      = "80 port(s) open"
    action     = "allow"
    protocol   = "tcp"
    cidr       = ["0.0.0.0/0"]
    port_range = "80"
  }

  ingress_rule {
    label      = "443 port(s) open"
    action     = "allow"
    protocol   = "tcp"
    cidr       = ["0.0.0.0/0"]
    port_range = "443"
  }

  egress_rule {
    label      = "All TCP ports open"
    action     = "allow"
    protocol   = "tcp"
    cidr       = ["0.0.0.0/0"]
    port_range = "0-65535"
  }

  egress_rule {
    label      = "All UDP ports open"
    action     = "allow"
    protocol   = "udp"
    cidr       = ["0.0.0.0/0"]
    port_range = "0-65535"
  }

  egress_rule {
    label    = "Ping/traceroute"
    action   = "allow"
    protocol = "icmp"
    cidr     = ["0.0.0.0/0"]
  }
}

# Create a cluster with k3s
resource "civo_kubernetes_cluster" "main" {
  name         = var.name
  cluster_type = "k3s"

  kubernetes_version = "1.27.1-k3s1"

  applications = "traefik2-loadbalancer,metrics-server"

  cni         = var.cni
  network_id  = civo_network.main.id
  firewall_id = civo_firewall.main.id

  pools {
    label      = "default"
    size       = var.node_size
    node_count = var.node_count
  }
}

# find the cluster's load balancer
data civo_loadbalancer "main" {
  name = "${var.name}-kube-system-traefik"
}
