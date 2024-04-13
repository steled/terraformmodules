resource "kubernetes_endpoints" "hassio" {
  metadata {
    name = "hassio"
    namespace = kubernetes_namespace.hassio.metadata[0].name
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
