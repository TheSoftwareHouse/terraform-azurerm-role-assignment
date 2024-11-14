provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-northeu-001"
  location = "northeurope"
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "terraform-identity-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

module "role_assignments" {
  source = "retoxx-dev/role-assignment/azurerm"

  role_assignments = [
    {
      scope         = azurerm_resource_group.this.id
      principal_ids = [azurerm_user_assigned_identity.this.principal_id]
      role_names    = ["Reader", "Web Plan Contributor"]
    }
  ]
}