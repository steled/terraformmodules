<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.17 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.17 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.victoriametrics](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_config_map_v1.metrics_proxy_config](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map_v1) | resource |
| [kubernetes_daemon_set_v1.metrics_proxy](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/daemon_set_v1) | resource |
| [kubernetes_namespace.victoriametrics](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.victoriametrics_basic_auth_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alertmanager_domains"></a> [alertmanager\_domains](#input\_alertmanager\_domains) | n/a | `string` | n/a | yes |
| <a name="input_apprise_config_id"></a> [apprise\_config\_id](#input\_apprise\_config\_id) | n/a | `string` | n/a | yes |
| <a name="input_authentik_url"></a> [authentik\_url](#input\_authentik\_url) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_grafana_admin_password"></a> [grafana\_admin\_password](#input\_grafana\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_grafana_admin_user"></a> [grafana\_admin\_user](#input\_grafana\_admin\_user) | n/a | `string` | n/a | yes |
| <a name="input_grafana_client_id"></a> [grafana\_client\_id](#input\_grafana\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_grafana_client_secret"></a> [grafana\_client\_secret](#input\_grafana\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_grafana_domains"></a> [grafana\_domains](#input\_grafana\_domains) | n/a | `string` | n/a | yes |
| <a name="input_haproxy_version"></a> [haproxy\_version](#input\_haproxy\_version) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_namespace_name"></a> [kubernetes\_namespace\_name](#input\_kubernetes\_namespace\_name) | n/a | `string` | n/a | yes |
| <a name="input_notify_domain"></a> [notify\_domain](#input\_notify\_domain) | n/a | `string` | n/a | yes |
| <a name="input_telegram_bot_token"></a> [telegram\_bot\_token](#input\_telegram\_bot\_token) | n/a | `string` | n/a | yes |
| <a name="input_telegram_chat_id"></a> [telegram\_chat\_id](#input\_telegram\_chat\_id) | n/a | `string` | n/a | yes |
| <a name="input_victoriametrics_version"></a> [victoriametrics\_version](#input\_victoriametrics\_version) | n/a | `string` | n/a | yes |
| <a name="input_vmagent_domains"></a> [vmagent\_domains](#input\_vmagent\_domains) | n/a | `string` | n/a | yes |
| <a name="input_vmalert_domains"></a> [vmalert\_domains](#input\_vmalert\_domains) | n/a | `string` | n/a | yes |
| <a name="input_vmsingle_domains"></a> [vmsingle\_domains](#input\_vmsingle\_domains) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->