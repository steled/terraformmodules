resource "kubernetes_namespace" "hassio" {
  metadata {
    name = var.namespace
  }
}
