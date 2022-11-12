resource "kubernetes_namespace" "keda" {
  metadata {
    name = "keda"
  }
}

# https://keda.sh/
resource "helm_release" "keda" {
  name       = "keda"
  namespace  = "keda"
  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  version    = var.keda_version
  depends_on = [azurerm_kubernetes_cluster.cluster,kubernetes_namespace.keda]
}

