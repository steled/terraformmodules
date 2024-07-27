resource "helm_release" "duckdns_webhook" {
  name       = "duckdns-webhook"
  namespace  = kubernetes_namespace.certmanager.metadata[0].name

  repository = "https://steled.github.io/cert-manager-webhook-duckdns/"
  chart      = "cert-manager-webhook-duckdns"
  version    = var.duckdns_webhook_version # check version here: https://github.com/steled/cert-manager-webhook-duckdns/blob/master/charts/cert-manager-webhook-duckdns/Chart.yaml#L4

  values = [ file(var.duckdns_webhook_values_yaml) ]
}
