resource "helm_release" "sftp" {
  name      = "sftp"
  namespace = var.namespace

  chart = "https://github.com/steled/sftp-server/archive/refs/tags/v0.3.11.tar.gz"

  values = [ file(var.values_yaml) ]
}
