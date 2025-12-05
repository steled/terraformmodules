resource "kubernetes_namespace_v1" "monitoring" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "monitoring" {
  name = "prometheus-community"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = var.monitoring_version # check version here: https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/Chart.yaml
  #  force_update  = true
  #  recreate_pods = true

  #  values = [ file("values.yaml") ]
  values = [templatefile("values.yaml", {
    grafana_admin_password = var.grafana_admin_password,
    grafana_environment    = var.grafana_environment,
    grafana_domain         = var.grafana_domain
  })]

  namespace = kubernetes_namespace_v1.monitoring.metadata[0].name
}
