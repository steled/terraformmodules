resource "kubernetes_namespace" "metallb" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "metallb" {
  name          = "metallb"
  namespace     = kubernetes_namespace.metallb.metadata[0].name

  repository    = "https://metallb.github.io/metallb"
  chart         = "metallb"
  version       = var.metallb_version # check version here: https://github.com/metallb/metallb/blob/v0.14.5/charts/metallb/Chart.yaml#L44
  recreate_pods = true

  values = [ file(var.values_yaml) ]

  set {
    name = "controller.image.tag"
    value = var.metallb_version
  }

  set {
    name = "speaker.image.tag"
    value = var.metallb_version
  }

  # depends_on    = [ kubernetes_namespace.metallb, ]
}
