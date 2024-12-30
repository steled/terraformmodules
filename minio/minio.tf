resource "kubernetes_namespace" "minio" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "minio" {
  name      = "minio"
  namespace = kubernetes_namespace.minio.metadata[0].name

  repository = "https://charts.min.io/"
  chart      = "minio"
  version    = var.minio_version

  values = [templatefile(var.values_yaml, {
    environment             = var.environment
    ingress_domains         = var.ingress_domains
    console_ingress_domains = var.console_ingress_domains
    user1_name              = var.user1_name
    user1_policy            = var.user1_policy
    user1_accessKey         = var.user1_accessKey
  })]
}
