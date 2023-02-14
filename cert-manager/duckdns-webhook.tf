resource "helm_release" "duckdns_webhook" {
  name       = "duckdns-webhook"

  repository = "https://ebrianne.github.io/helm-charts"
  chart      = "cert-manager-webhook-duckdns"
  version    = var.duckdns_webhook_version # check version here: https://github.com/ebrianne/helm-charts/blob/master/charts/cert-manager-webhook-duckdns/Chart.yaml

  values = [ var.values_yaml ]

  namespace = kubernetes_namespace.certmanager.metadata[0].name
}
