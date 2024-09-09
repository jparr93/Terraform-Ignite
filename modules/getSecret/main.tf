data "azurerm_key_vault" "main" {
  name                = var.keyVault_Name
  resource_group_name = "some-resource-group"
}

data "azurerm_key_vault_secret" "main" {
  name      = var.secret_Name
  key_vault_id = data.azurerm_key_vault.main.id
}

