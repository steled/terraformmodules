resource "kubernetes_namespace_v1" "certmanager" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "certmanager" {
  name      = "cert-manager"
  namespace = kubernetes_namespace_v1.certmanager.metadata[0].name

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_version # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/

  set = [
    {
      name  = "installCRDs"
      value = "true"
    }
  ]
}
