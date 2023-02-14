resource "kubernetes_namespace" "ingress" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "ingress" {
  name          = "ingress"

  repository    = "https://kubernetes.github.io/ingress-nginx"
  chart         = "ingress-nginx"
  version       = var.ingress_version # check version here: https://github.com/kubernetes/ingress-nginx/blob/master/charts/ingress-nginx/Chart.yaml
  force_update  = false
  recreate_pods = true

  values        = [ var.values_yaml ]

  namespace     = kubernetes_namespace.ingress.metadata[0].name
}
