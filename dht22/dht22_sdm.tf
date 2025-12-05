resource "kubernetes_namespace_v1" "sdm-dht22" {
  metadata {
    name = var.namespace
  }
}

module "sdm" {
  source    = "./sdm"
  namespace = kubernetes_namespace_v1.sdm-dht22.metadata[0].name
  node_name = var.node_name
  image     = var.sdm_image # check version here: https://gitlab.com/arm-research/smarter/smarter-device-manager/container_registry/1080664
}

module "dht22" {
  source = "./dht22"

  namespace = kubernetes_namespace_v1.sdm-dht22.metadata[0].name
  node_name = var.node_name
  image     = var.dht22_image

  depends_on = [module.sdm, ]
}
