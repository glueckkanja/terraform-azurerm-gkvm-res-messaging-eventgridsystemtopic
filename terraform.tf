terraform {
  required_version = ">= 1.9, < 2.0"
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.0, < 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0, < 5.0"
    }
    modtm = {
      source  = "azure/modtm"
      version = "~> 0.3, < 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5, < 4.0"
    }
  }
}
