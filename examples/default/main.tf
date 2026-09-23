terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.21"
    }
  }
}

provider "azurerm" {
  features {}
}

# The e2e run applies this example for real. A fixed region keeps it
# deterministic; the randomised AVM region pick can land on regions the test
# subscription cannot use (e.g. southafricawest).
locals {
  location = "westeurope"
}

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "~> 0.3"
}

# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = local.location
  name     = module.naming.resource_group.name_unique
}

resource "azurerm_storage_account" "test_storage_account" {
  account_replication_type = "ZRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.this.location
  name                     = module.naming.storage_account.name_unique
  resource_group_name      = azurerm_resource_group.this.name
}

module "test" {
  source = "../../"

  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  # ...
  location            = azurerm_resource_group.this.location
  name                = module.naming.eventgrid_topic.name_unique
  resource_group_name = azurerm_resource_group.this.name
  topic_source        = azurerm_storage_account.test_storage_account.id
  topic_type          = "Microsoft.Storage.StorageAccounts"
}
