resource "kubectl_manifest" "metallb_ipaddresspool" {
  yaml_body = <<YAML
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: generic-cluster-pool
  namespace: ${kubernetes_namespace.metallb.metadata[0].name}
spec:
  addresses:
    ${ var.helm_values_addresses}
YAML

  depends_on = [ helm_release.metallb ]
}

resource "kubectl_manifest" "metallb_l2advertisement" {
  yaml_body = <<YAML
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: generic-cluster-pool
  namespace: ${kubernetes_namespace.metallb.metadata[0].name}
YAML

  depends_on = [ helm_release.metallb ]
}
