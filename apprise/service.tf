resource "kubernetes_service_v1" "apprise" {
  metadata {
    name      = "apprise"
    namespace = var.kubernetes_namespace_name

    labels = {
      name = "apprise"
    }
  }
  spec {
    type = "ClusterIP"

    selector = {
      name = kubernetes_deployment_v1.apprise.metadata[0].labels.name
    }

    port {
      name        = "http"
      port        = 80
      target_port = 8000
    }
  }
}
