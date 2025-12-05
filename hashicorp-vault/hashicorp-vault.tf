resource "kubernetes_namespace_v1" "hashicorp_vault" {
  metadata {
    name = var.kubernetes_namespace_name
  }

  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir --mode 0755 -p /ext/persistent/hashicorp-vault/data",
      "sudo chown 100:1000 -R /ext/persistent/hashicorp-vault/data/"
    ]
  }
}

resource "helm_release" "hashicorp_vault" {
  name      = "vault"
  namespace = kubernetes_namespace_v1.hashicorp_vault.metadata[0].name

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = var.hashicorp_vault_version

  values = [templatefile(var.values_yaml, {
    environment            = var.environment
    hashicorp_vault_domain = var.hashicorp_vault_domain
    ip_address             = var.ip_address
  })]

  provisioner "local-exec" {
    when    = create
    command = "kubectl exec -it -n hashicorp-vault vault-0 -- vault operator init -address http://127.0.0.1:8200 -key-shares 3 -key-threshold 2 || true"
  }

  depends_on = [
    # kubectl_manifest.cert_manager_certificate_steled_selfsigned_ca,
    kubernetes_persistent_volume_claim_v1.hashicorp_vault_data_pvc
  ]
}
