<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 3.1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 3.1.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.gitea](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.gitea](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_persistent_volume.gitea-backup-pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.gitea-postgresql-pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.gitea-server-pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume_claim.gitea-backup-pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.gitea-postgresql-pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.gitea-server-pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_secret.gitea-admin-secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_gitea_admin_email"></a> [gitea\_admin\_email](#input\_gitea\_admin\_email) | n/a | `string` | n/a | yes |
| <a name="input_gitea_admin_password"></a> [gitea\_admin\_password](#input\_gitea\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_gitea_admin_username"></a> [gitea\_admin\_username](#input\_gitea\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_gitea_domain"></a> [gitea\_domain](#input\_gitea\_domain) | n/a | `string` | n/a | yes |
| <a name="input_gitea_oauth2_jwt_secret"></a> [gitea\_oauth2\_jwt\_secret](#input\_gitea\_oauth2\_jwt\_secret) | n/a | `string` | n/a | yes |
| <a name="input_gitea_security_internal_token"></a> [gitea\_security\_internal\_token](#input\_gitea\_security\_internal\_token) | n/a | `string` | n/a | yes |
| <a name="input_gitea_security_secret_key"></a> [gitea\_security\_secret\_key](#input\_gitea\_security\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_gitea_server_lfs_jwt_secret"></a> [gitea\_server\_lfs\_jwt\_secret](#input\_gitea\_server\_lfs\_jwt\_secret) | n/a | `string` | n/a | yes |
| <a name="input_gitea_version"></a> [gitea\_version](#input\_gitea\_version) | Set the version of gitea | `string` | n/a | yes |
| <a name="input_kubernetes_namespace_name"></a> [kubernetes\_namespace\_name](#input\_kubernetes\_namespace\_name) | Name of the kubernetes namespace | `string` | n/a | yes |
| <a name="input_values_yaml"></a> [values\_yaml](#input\_values\_yaml) | Path to the values.yml file, relative to the root module | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->