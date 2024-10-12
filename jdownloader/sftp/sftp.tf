resource "helm_release" "sftp" {
  name      = "sftp"
  namespace = var.namespace

  chart = "https://github.com/steled/sftp-server/archive/refs/tags/v0.3.11.tar.gz"

  values = [ templatefile(var.values_yaml, {
    sftp_ip_address = var.sftp_ip_address
  })]
}
