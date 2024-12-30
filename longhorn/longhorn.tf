resource "kubernetes_namespace" "longhorn" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "longhorn" {
  name      = "longhorn"
  namespace = kubernetes_namespace.longhorn.metadata[0].name

  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  version    = var.longhorn_version

  values = [templatefile(var.values_yaml, {
    environment = var.environment
    domain      = var.domain
  })]
}
