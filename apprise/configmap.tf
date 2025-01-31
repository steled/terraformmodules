# resource "kubernetes_config_map_v1" "apprise_api_override_conf_config" {
#   metadata {
#     name      = "apprise-api-override-conf-config"
#     namespace = var.kubernetes_namespace_name

#     labels = {
#       name = "apprise"
#     }
#   }

#   data = {
#     "location-override.conf" = <<EOF
# auth_basic            "Apprise API Restricted Area";
# auth_basic_user_file  /etc/nginx/.htpasswd;
# EOF
#   }
# }
