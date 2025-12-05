resource "kubernetes_endpoints_v1" "hassio" {
  metadata {
    name      = "hassio"
    namespace = kubernetes_namespace_v1.hassio.metadata[0].name
  }

  subset {
    address {
      ip = var.ip
    }

    port {
      name     = "hassio"
      port     = 8123
      protocol = "TCP"
    }
  }
}
