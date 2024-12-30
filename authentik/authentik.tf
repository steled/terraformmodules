resource "kubernetes_namespace" "authentik" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "authentik" {
  name      = "authentik"
  namespace = kubernetes_namespace.authentik.metadata[0].name

  repository = "https://charts.goauthentik.io"
  chart      = "authentik"
  version    = var.authentik_version

  values = [templatefile(var.values_yaml, {
    environment          = var.environment
    authentik_domains    = var.authentik_domains
    authentik_secret_key = var.authentik_secret_key
    postgresql_password  = var.postgresql_password
  })]
}
