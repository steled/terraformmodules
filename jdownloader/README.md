<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.9 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_jd"></a> [jd](#module\_jd) | ./jd | n/a |
| <a name="module_sftp"></a> [sftp](#module\_sftp) | ./sftp | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_cron_job_v1.rsync_cronjob](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cron_job_v1) | resource |
| [kubernetes_namespace.jd-sftp](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_persistent_volume.jd-sftp-config-pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.jd-sftp-downloads-pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume.jd-sftp-logs-pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume_claim.jd-sftp-config-pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.jd-sftp-downloads-pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.jd-sftp-logs-pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_secret_v1.rsync_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_jd_devicename"></a> [env\_jd\_devicename](#input\_env\_jd\_devicename) | n/a | `string` | n/a | yes |
| <a name="input_env_jd_email"></a> [env\_jd\_email](#input\_env\_jd\_email) | n/a | `string` | n/a | yes |
| <a name="input_env_jd_password"></a> [env\_jd\_password](#input\_env\_jd\_password) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the kubernetes namespace | `string` | n/a | yes |
| <a name="input_rsync_dst_folder_path"></a> [rsync\_dst\_folder\_path](#input\_rsync\_dst\_folder\_path) | Destination folder path for rsync cronjob | `string` | n/a | yes |
| <a name="input_rsync_dst_ip_address"></a> [rsync\_dst\_ip\_address](#input\_rsync\_dst\_ip\_address) | Destination ip address for rsync cronjob | `string` | n/a | yes |
| <a name="input_rsync_src_folder_path"></a> [rsync\_src\_folder\_path](#input\_rsync\_src\_folder\_path) | Source folder path for rsync cronjob | `string` | n/a | yes |
| <a name="input_rsync_upload_id_rsa"></a> [rsync\_upload\_id\_rsa](#input\_rsync\_upload\_id\_rsa) | Path to the upload.id\_rsa file | `string` | n/a | yes |
| <a name="input_rsync_username"></a> [rsync\_username](#input\_rsync\_username) | Username for rsync cronjob | `string` | n/a | yes |
| <a name="input_sftp_chart"></a> [sftp\_chart](#input\_sftp\_chart) | Set the version of sftp | `string` | n/a | yes |
| <a name="input_sftp_ip_address"></a> [sftp\_ip\_address](#input\_sftp\_ip\_address) | IP address for SFTP service | `string` | n/a | yes |
| <a name="input_sftp_values_yaml"></a> [sftp\_values\_yaml](#input\_sftp\_values\_yaml) | Path to the values.yml file, relative to the root module | `string` | n/a | yes |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | Host for SSH connection | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Username for SSH connection | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->