resource "kubernetes_namespace" "gitea" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "gitea" {
  name       = "gitea"

  repository = "https://dl.gitea.io/charts/"
  chart      = "gitea"
  version    = var.gitea_version # check version here: https://gitea.com/gitea/helm-chart/src/branch/master/Chart.yaml
#  force_update  = true
#  recreate_pods = true

  values = [ templatefile(var.values_yaml, {
    gitea_domain = var.gitea_domain
    environment = var.environment
    gitea_admin_username = var.gitea_admin_username
    gitea_admin_password = var.gitea_admin_password
    gitea_admin_email = var.gitea_admin_email
    gitea_oauth2_jwt_secret = var.gitea_oauth2_jwt_secret
    gitea_security_internal_token = var.gitea_security_internal_token
    gitea_security_secret_key = var.gitea_security_secret_key
    gitea_server_lfs_jwt_secret = var.gitea_server_lfs_jwt_secret
  }) ]

  namespace = kubernetes_namespace.gitea.metadata[0].name
}
