resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = kubernetes_namespace.argocd.metadata[0].name

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_version

  values = [templatefile(var.argocd_values_yaml, {
    environment               = var.environment
    domain                    = var.domain
    telegram_bot_token        = var.telegram_bot_token
    accounts_steled_password  = var.accounts_steled_password
    argocd_apps_sshPrivateKey = var.apps_sshPrivateKey
  })]

  provisioner "local-exec" {
    when    = destroy
    command = "kubectl delete crd applications.argoproj.io applicationsets.argoproj.io appprojects.argoproj.io"
  }
}

resource "helm_release" "argocd-apps" {
  name      = "argocd-apps"
  namespace = kubernetes_namespace.argocd.metadata[0].name

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = var.argocd_apps_version

  values = [file(var.argocd_apps_values_yaml)]

  depends_on = [helm_release.argocd]
}
