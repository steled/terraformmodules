resource "kubernetes_service" "hassio" {
  metadata {
    name      = "hassio"
    namespace = kubernetes_namespace.hassio.metadata[0].name
  }
  spec {
    port {
      name        = "hassio"
      port        = 443
      target_port = 8123
      protocol    = "TCP"
    }
  }
}
