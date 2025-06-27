<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 3.0.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 3.0.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.authentik](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.authentik](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.authentik_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authentik_bootstrap_email"></a> [authentik\_bootstrap\_email](#input\_authentik\_bootstrap\_email) | n/a | `string` | n/a | yes |
| <a name="input_authentik_bootstrap_password"></a> [authentik\_bootstrap\_password](#input\_authentik\_bootstrap\_password) | n/a | `string` | n/a | yes |
| <a name="input_authentik_bootstrap_token"></a> [authentik\_bootstrap\_token](#input\_authentik\_bootstrap\_token) | n/a | `string` | n/a | yes |
| <a name="input_authentik_domains"></a> [authentik\_domains](#input\_authentik\_domains) | n/a | `string` | n/a | yes |
| <a name="input_authentik_secret_key"></a> [authentik\_secret\_key](#input\_authentik\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_authentik_version"></a> [authentik\_version](#input\_authentik\_version) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_namespace_name"></a> [kubernetes\_namespace\_name](#input\_kubernetes\_namespace\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_password"></a> [postgresql\_password](#input\_postgresql\_password) | n/a | `string` | n/a | yes |
| <a name="input_values_yaml"></a> [values\_yaml](#input\_values\_yaml) | Path to the values.yml file, relative to the root module | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->