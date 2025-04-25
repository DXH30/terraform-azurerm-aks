## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.worker](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_log_analytics_workspace.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_workspace.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_workspace) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | n/a | `string` | `""` | no |
| <a name="input_acr_rg"></a> [acr\_rg](#input\_acr\_rg) | n/a | `string` | `""` | no |
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | n/a | `string` | `""` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | n/a | `string` | `""` | no |
| <a name="input_auto_scaling_enabled"></a> [auto\_scaling\_enabled](#input\_auto\_scaling\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_department"></a> [department](#input\_department) | n/a | `string` | `"ds"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"Southeast Asia"` | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | n/a | `number` | `0` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | n/a | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"temporary"` | no |
| <a name="input_pod_cidr"></a> [pod\_cidr](#input\_pod\_cidr) | n/a | `string` | `"10.244.0.0/16"` | no |
| <a name="input_pool_size"></a> [pool\_size](#input\_pool\_size) | n/a | `string` | `"Standard_B2s"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `""` | no |

## Outputs

No outputs.
