resource "kubernetes_secret_v1" "jdownloader_secret" {
  metadata {
    name      = "jdownloader"
    namespace = var.namespace
  }

  data = {
    env_jd_email      = var.env_jd_email
    env_jd_devicename = var.env_jd_devicename
    env_jd_password   = var.env_jd_password
  }

  type = "Opaque"
}