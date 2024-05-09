resource "kubernetes_namespace" "metallb" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "metallb" {
  name          = "metallb"
  namespace     = kubernetes_namespace.metallb.metadata[0].name

  repository    = "oci://registry-1.docker.io/bitnamicharts/metallb"
  chart         = "metallb"
  version       = var.metallb_version # check version here: https://github.com/bitnami/charts/blob/main/bitnami/metallb/Chart.yaml#L38
  recreate_pods = true

  values = [ file(var.values_yaml) ]

  # depends_on    = [ kubernetes_namespace.metallb, ]
}
