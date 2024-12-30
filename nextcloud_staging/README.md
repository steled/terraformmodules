<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.nextcloud_staging](https://registry.terraform.io/providers/hashicorp/helm/2.17/docs/resources/release) | resource |
| [kubernetes_job.nextcloud_staging_maintenance_job](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/job) | resource |
| [kubernetes_namespace.nextcloud_staging](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_persistent_volume.nextcloud_staging_backup_pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.nextcloud_staging_postgresql_pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.nextcloud_staging_redis_master_pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.nextcloud_staging_redis_replica_pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.nextcloud_staging_server_pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume_claim.nextcloud_staging_backup_pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.nextcloud_staging_postgresql_pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.nextcloud_staging_redis_master_pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.nextcloud_staging_redis_replica_pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.nextcloud_staging_server_pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_secret.nextcloud_staging_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_namespace_name"></a> [kubernetes\_namespace\_name](#input\_kubernetes\_namespace\_name) | n/a | `string` | n/a | yes |
| <a name="input_mail_domain"></a> [mail\_domain](#input\_mail\_domain) | n/a | `string` | n/a | yes |
| <a name="input_mail_fromaddress"></a> [mail\_fromaddress](#input\_mail\_fromaddress) | n/a | `string` | n/a | yes |
| <a name="input_maintenance_job_image"></a> [maintenance\_job\_image](#input\_maintenance\_job\_image) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_admin_password"></a> [nextcloud\_admin\_password](#input\_nextcloud\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_admin_username"></a> [nextcloud\_admin\_username](#input\_nextcloud\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_domain"></a> [nextcloud\_domain](#input\_nextcloud\_domain) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_proxies"></a> [nextcloud\_proxies](#input\_nextcloud\_proxies) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_version"></a> [nextcloud\_version](#input\_nextcloud\_version) | Set the version of nextcloud | `string` | n/a | yes |
| <a name="input_postgresql_database"></a> [postgresql\_database](#input\_postgresql\_database) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_password"></a> [postgresql\_password](#input\_postgresql\_password) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_username"></a> [postgresql\_username](#input\_postgresql\_username) | n/a | `string` | n/a | yes |
| <a name="input_redis_password"></a> [redis\_password](#input\_redis\_password) | n/a | `string` | n/a | yes |
| <a name="input_smtp_host"></a> [smtp\_host](#input\_smtp\_host) | n/a | `string` | n/a | yes |
| <a name="input_smtp_password"></a> [smtp\_password](#input\_smtp\_password) | n/a | `string` | n/a | yes |
| <a name="input_smtp_port"></a> [smtp\_port](#input\_smtp\_port) | n/a | `string` | n/a | yes |
| <a name="input_smtp_username"></a> [smtp\_username](#input\_smtp\_username) | n/a | `string` | n/a | yes |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | Host for SSH connection | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Username for SSH connection | `string` | n/a | yes |
| <a name="input_values_yaml"></a> [values\_yaml](#input\_values\_yaml) | Path to the values.yml file, relative to the root module | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->