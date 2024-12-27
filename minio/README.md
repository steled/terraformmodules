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
| [helm_release.minio](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.minio](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.minio_basic_auth_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_console_ingress_domains"></a> [console\_ingress\_domains](#input\_console\_ingress\_domains) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_ingress_domains"></a> [ingress\_domains](#input\_ingress\_domains) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_namespace_name"></a> [kubernetes\_namespace\_name](#input\_kubernetes\_namespace\_name) | n/a | `string` | n/a | yes |
| <a name="input_minio_version"></a> [minio\_version](#input\_minio\_version) | n/a | `string` | n/a | yes |
| <a name="input_rootPassword"></a> [rootPassword](#input\_rootPassword) | n/a | `string` | n/a | yes |
| <a name="input_rootUser"></a> [rootUser](#input\_rootUser) | n/a | `string` | n/a | yes |
| <a name="input_user1_accessKey"></a> [user1\_accessKey](#input\_user1\_accessKey) | n/a | `string` | n/a | yes |
| <a name="input_user1_name"></a> [user1\_name](#input\_user1\_name) | n/a | `string` | n/a | yes |
| <a name="input_user1_password"></a> [user1\_password](#input\_user1\_password) | n/a | `string` | n/a | yes |
| <a name="input_user1_policy"></a> [user1\_policy](#input\_user1\_policy) | n/a | `string` | n/a | yes |
| <a name="input_user1_secretKey"></a> [user1\_secretKey](#input\_user1\_secretKey) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->