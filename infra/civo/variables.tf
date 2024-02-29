variable "name" {
  default = "cncf-wasm-webinar"
}

variable "region" {
  default = "NYC1"
}

variable "node_size" {
  default = "g4s.kube.medium"
}

variable "node_count" {
  default = 3
}

variable "allowed_api_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "cni" {
  default = "cilium"
}
