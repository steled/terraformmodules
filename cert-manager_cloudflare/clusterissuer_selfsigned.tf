resource "kubectl_manifest" "cert_manager_cluster_issuer_selfsigned_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned-issuer
spec:
  selfSigned: {}
YAML

  depends_on = [ helm_release.certmanager ]
}

resource "kubectl_manifest" "cert_manager_certificate_steled_selfsigned_ca" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: steled-selfsigned-ca
  namespace: ${kubernetes_namespace.certmanager.metadata[0].name}
spec:
  commonName: steled-selfsigned-ca
  isCA: true
  issuerRef:
    name: selfsigned-issuer
    kind: ClusterIssuer
    group: cert-manager.io
  privateKey:
    algorithm: ECDSA
    size: 256
  secretName: root-secret
  subject:
    organizations:
      - steled
YAML

  depends_on = [
    helm_release.certmanager,
    kubectl_manifest.cert_manager_cluster_issuer_selfsigned_issuer
  ]
}

resource "kubectl_manifest" "cert_manager_cluster_issuer_steled_ca_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: steled-ca-issuer
spec:
  ca:
    secretName: root-secret
YAML

  depends_on = [
    helm_release.certmanager,
    kubectl_manifest.cert_manager_cluster_issuer_selfsigned_issuer
  ]
}
