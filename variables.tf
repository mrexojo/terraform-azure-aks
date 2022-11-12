variable "company" {
  description = "Company name"
}

variable "location" {
  description = "Cluster location"
}

variable "name" {
  description = "Name of the kubernetes cluster"
}

variable "k8s_version" {
  description = "Kubernetes Version"
}

variable "flavor" {
  description = "VM size of nodes"
  default = "standard_a2_v2"
}

variable "minimal_nodes" {
  description = "number of minimal nodes"
  default = 1
}

variable "keda_version" {
  description = "number of minimal nodes"
  default = "2.7.0"
}


# output

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
  sensitive = true
}