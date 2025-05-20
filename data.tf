data "azapi_resource" "rg" {
  type = "Microsoft.Resources/resourceGroups@2024-11-01"
  name = var.resource_group_name
}
