# resource "kubectl_manifest" "cert_manager_cluster_issuer_letsencrypt_staging" {
#   yaml_body = <<YAML
# apiVersion: cert-manager.io/v1
# kind: ClusterIssuer
# metadata:
#   name: cloudflare-letsencrypt-staging
# spec:
#   acme:
#     email: ${var.cert_manager_email}
#     privateKeySecretRef:
#       name: cloudflare-letsencrypt-staging
#     server: https://acme-staging-v02.api.letsencrypt.org/directory
#     solvers:
#     - dns01:
#         cloudflare:
#           apiTokenSecretRef:
#             key: api-token
#             name: cloudflare-api-token
# YAML

#   depends_on = [
#     kubernetes_secret_v1.cloudflare_api_token_secret,
#     helm_release.certmanager
#   ]
# }

resource "kubernetes_manifest" "cert_manager_cluster_issuer_letsencrypt_staging" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "cloudflare-letsencrypt-staging"
    }
    "spec" = {
      "acme" = {
        "email" = var.cert_manager_email
        "privateKeySecretRef" = {
          "name" = "cloudflare-letsencrypt-staging"
        }
        "server" = "https://acme-staging-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "dns01" = {
              "cloudflare" = {
                "apiTokenSecretRef" = {
                  "key"  = "api-token"
                  "name" = "cloudflare-api-token"
                }
              }
            }
          }
        ]
      }
    }
  }

  depends_on = [
    kubernetes_secret_v1.cloudflare_api_token_secret,
    helm_release.certmanager
  ]
}

# resource "kubectl_manifest" "cert_manager_cluster_issuer_letsencrypt_production" {
#   yaml_body = <<YAML
# apiVersion: cert-manager.io/v1
# kind: ClusterIssuer
# metadata:
#   name: cloudflare-letsencrypt-production
# spec:
#   acme:
#     email: ${var.cert_manager_email}
#     privateKeySecretRef:
#       name: cloudflare-letsencrypt-production
#     server: https://acme-v02.api.letsencrypt.org/directory
#     solvers:
#     - dns01:
#         cloudflare:
#           apiTokenSecretRef:
#             key: api-token
#             name: cloudflare-api-token
# YAML

#   depends_on = [
#     kubernetes_secret_v1.cloudflare_api_token_secret,
#     helm_release.certmanager
#   ]
# }

resource "kubernetes_manifest" "cert_manager_cluster_issuer_letsencrypt_production" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "cloudflare-letsencrypt-production"
    }
    "spec" = {
      "acme" = {
        "email" = var.cert_manager_email
        "privateKeySecretRef" = {
          "name" = "cloudflare-letsencrypt-production"
        }
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "dns01" = {
              "cloudflare" = {
                "apiTokenSecretRef" = {
                  "key"  = "api-token"
                  "name" = "cloudflare-api-token"
                }
              }
            }
          }
        ]
      }
    }
  }

  depends_on = [
    kubernetes_secret_v1.cloudflare_api_token_secret,
    helm_release.certmanager
  ]
}
