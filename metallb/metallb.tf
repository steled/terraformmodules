resource "kubernetes_namespace" "metallb" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "metallb" {
  name          = "metallb"
  namespace     = kubernetes_namespace.metallb.metadata[0].name

  repository    = "https://charts.bitnami.com/bitnami"
  chart         = "metallb"
  version       = var.version # check version here: https://github.com/bitnami/charts/blob/master/bitnami/metallb/Chart.yaml
  recreate_pods = true

  values = [ file(var.values_yaml) ]

  # depends_on    = [ kubernetes_namespace.metallb, ]
}
