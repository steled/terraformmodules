resource "helm_release" "sftp" {
  name       = "sftp"

  chart      = "https://github.com/steled/sftp-server/archive/refs/tags/v0.3.5.tar.gz"

  values = [ var.values_yaml ]

  namespace = var.kubernetes_namespace_name
}