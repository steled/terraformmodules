resource "helm_release" "duckdns_webhook" {
  name       = "duckdns-webhook"
  namespace  = kubernetes_namespace.certmanager.metadata[0].name

  repository = "https://ebrianne.github.io/helm-charts"
  chart      = "cert-manager-webhook-duckdns"
  version    = var.duckdns_webhook_version # check version here: https://github.com/ebrianne/helm-charts/blob/master/charts/cert-manager-webhook-duckdns/Chart.yaml

  values = [ file(var.duckdns_webhook_values_yaml) ]
}
