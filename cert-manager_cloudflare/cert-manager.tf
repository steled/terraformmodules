resource "kubernetes_namespace" "certmanager" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "certmanager" {
  name      = "cert-manager"
  namespace = kubernetes_namespace.certmanager.metadata[0].name

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_version # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/

  set {
    name  = "installCRDs"
    value = "true"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "kubectl delete crd certificaterequests.cert-manager.io certificates.cert-manager.io challenges.acme.cert-manager.io clusterissuers.cert-manager.io issuers.cert-manager.io orders.acme.cert-manager.io"
  }

  depends_on = [kubernetes_secret.cloudflare_api_token_secret]
}
