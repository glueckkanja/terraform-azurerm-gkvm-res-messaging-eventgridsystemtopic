data "azapi_resource" "rg" {
  name = var.resource_group_name
  type = "Microsoft.Resources/resourceGroups@2024-11-01"
}
