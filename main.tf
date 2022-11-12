# - Resources

resource "azurerm_resource_group" "rg" {
  name     = "aks-cluster-${var.name}"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name       = "{var.componay}-aks-${var.name}"
  location   = azurerm_resource_group.rg.location
  dns_prefix = var.name

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = var.k8s_version

  default_node_pool {
    name       = "aks"
    node_count = var.minimal_nodes
    vm_size    = var.flavor
  }

  identity {
    type = "SystemAssigned"
  }
}
