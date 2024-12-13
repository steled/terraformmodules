<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.9.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_endpoints.hassio](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/endpoints) | resource |
| [kubernetes_ingress_v1.hassio](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace.hassio](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service_v1.hassio](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | n/a | `string` | n/a | yes |
| <a name="input_ip"></a> [ip](#input\_ip) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the kubernetes namespace | `string` | n/a | yes |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | Host for SSH connection | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Username for SSH connection | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->