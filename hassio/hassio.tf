resource "kubernetes_namespace" "hassio" {
  metadata {
    name = var.namespace
  }

  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir --mode 0755 -p /ext/backup/hassio",
      "sudo chown steled:steled -R /ext/backup/hassio/",
    ]
  }
}
