resource "azurerm_storage_account" "main" {
  name                     = "${var.storage_Account_Name}${var.storage_Account_Unique_Id}"
  resource_group_name      = azurerm_resource_group.management.name
  location                 = azurerm_resource_group.management.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_log_analytics_workspace" "main" {
  name                = var.log_Workspace_Name
  location            = azurerm_resource_group.management.location
  resource_group_name = azurerm_resource_group.management.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}