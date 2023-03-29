resource "kubernetes_namespace" "certmanager" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "certmanager" {
  name = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_version # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/

  set {
    name  = "installCRDs"
    value = "true"
  }

  namespace = kubernetes_namespace.certmanager.metadata[0].name
}
