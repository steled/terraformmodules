resource "kubernetes_namespace" "metallb" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "metallb" {
  name          = "metallb"

  repository    = "https://charts.bitnami.com/bitnami"
  chart         = "metallb"
  version       = var.metallb_version # check version here: https://github.com/bitnami/charts/blob/master/bitnami/metallb/Chart.yaml
  recreate_pods = true

  values = [ var.values_yaml ]

  namespace     = kubernetes_namespace.metallb.metadata[0].name

  depends_on    = [ kubernetes_namespace.metallb, ]
}
