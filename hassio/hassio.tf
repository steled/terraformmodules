resource "kubernetes_namespace" "hassio" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}