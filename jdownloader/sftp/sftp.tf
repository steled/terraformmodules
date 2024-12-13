resource "helm_release" "sftp" {
  name      = "sftp"
  namespace = var.namespace

  chart = var.sftp_version # check version here: https://github.com/steled/sftp-server/tags

  values = [templatefile(var.values_yaml, {
    sftp_ip_address = var.sftp_ip_address
  })]
}
