data "azurerm_key_vault" "main" {
  name                = var.keyVault_Name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "main" {
  name      = var.secret_Name
  key_vault_id = data.azurerm_key_vault.main.id
}

