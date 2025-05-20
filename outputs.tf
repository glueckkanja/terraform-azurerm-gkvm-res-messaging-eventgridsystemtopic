output "private_endpoints" {
  description = <<DESCRIPTION
  A map of the private endpoints created.
  DESCRIPTION
  value       = var.private_endpoints_manage_dns_zone_group ? azurerm_private_endpoint.this_managed_dns_zone_groups : azurerm_private_endpoint.this_unmanaged_dns_zone_groups
}

output "resource" {
  description = <<DESCRIPTION
  The Event Grid System Topic resource.
  DESCRIPTION
  value       = azapi_resource.this
}

output "resource_id" {
  description = <<DESCRIPTION
  The ID of the Event Grid System Topic.
  DESCRIPTION
  value       = azapi_resource.this.id
}
