resource "kubernetes_service_v1" "hassio" {
  metadata {
    name      = "hassio"
    namespace = kubernetes_namespace_v1.hassio.metadata[0].name
  }
  spec {
    port {
      name        = "hassio"
      port        = 443
      target_port = 8123
      protocol    = "TCP"
    }
    type = "ClusterIP"
  }
}
