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
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.argocd-apps](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace_v1.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts_steled_password"></a> [accounts\_steled\_password](#input\_accounts\_steled\_password) | Password for Argo CD user steled | `string` | n/a | yes |
| <a name="input_apps_sshPrivateKey"></a> [apps\_sshPrivateKey](#input\_apps\_sshPrivateKey) | SSH private key for argocd-apps repository | `string` | n/a | yes |
| <a name="input_argocd_apps_values_yaml"></a> [argocd\_apps\_values\_yaml](#input\_argocd\_apps\_values\_yaml) | Path to the Argo CD Apps values.yml file, relative to the root module | `string` | n/a | yes |
| <a name="input_argocd_apps_version"></a> [argocd\_apps\_version](#input\_argocd\_apps\_version) | n/a | `string` | n/a | yes |
| <a name="input_argocd_values_yaml"></a> [argocd\_values\_yaml](#input\_argocd\_values\_yaml) | Path to the Argo CD values.yml file, relative to the root module | `string` | n/a | yes |
| <a name="input_argocd_version"></a> [argocd\_version](#input\_argocd\_version) | n/a | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_namespace_name"></a> [kubernetes\_namespace\_name](#input\_kubernetes\_namespace\_name) | n/a | `string` | n/a | yes |
| <a name="input_telegram_bot_token"></a> [telegram\_bot\_token](#input\_telegram\_bot\_token) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->