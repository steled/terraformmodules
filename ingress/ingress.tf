resource "kubernetes_namespace" "ingress" {
  metadata {
    name = var.namespace
    name = var.namespace
  }
}

resource "helm_release" "ingress" {
  name          = "ingress-nginx"
  namespace     = kubernetes_namespace.ingress.metadata[0].name

  repository    = "https://kubernetes.github.io/ingress-nginx"
  chart         = "ingress-nginx"
  version       = var.version # check version here: https://github.com/kubernetes/ingress-nginx/blob/master/charts/ingress-nginx/Chart.yaml
  force_update  = false
  recreate_pods = true

  values        = [ templatefile(var.values_yaml, {
    ingress_ip_address = var.ingress_ip_address
  })]
}
