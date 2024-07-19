terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.113"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.53"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

resource "azurerm_resource_group" "this" {
  name     = "rg-example"
  location = "West Europe"
}

module "role_assignments" {
  #checkov:skip=CKV_TF_1: commit hash isn't needed as a standard semver version tag is used
  source = "../../"

  scope = azurerm_resource_group.this.id

  role_assignments = [
    {
      user_principal_names = ["test@example.com", "test2@example.com"]
      role_names           = ["Contributor", "Reader"]
    },
    {
      group_names = ["Group1"]
      role_names  = ["Reader"]
    },
    {
      service_principal_names = ["test"]
      role_names              = ["Contributor"]
    },
    {
      principal_ids = ["00000000-0000-0000-0000-000000000000"]
      role_names    = ["Reader"]
    }
  ]
}
