resource "helm_release" "duckdns_webhook" {
  # name       = "cert-manager-webhook-duckdns"
  name       = "cert-manager-duckdns-webhook"
  namespace  = kubernetes_namespace.certmanager.metadata[0].name

  # repository = "https://steled.github.io/cert-manager-webhook-duckdns/"
  repository = "https://csp33.github.io/cert-manager-duckdns-webhook"
  # chart      = "cert-manager-webhook-duckdns"
  chart      = "cert-manager-duckdns-webhook"
  version    = var.duckdns_webhook_version # check version here: https://github.com/steled/cert-manager-webhook-duckdns/blob/master/charts/cert-manager-webhook-duckdns/Chart.yaml#L4

  # values = [ templatefile(var.duckdns_webhook_values_yaml, {
  #   duckdns_webhook_ip_address = var.duckdns_webhook_ip_address
  # })]

  values = [ file(var.duckdns_webhook_values_yaml) ]

  depends_on = [ helm_release.certmanager ]
}
