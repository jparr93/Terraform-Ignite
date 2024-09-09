resource "azurerm_data_factory" "main" {
  name                = var.data_Factory_Name
  location            = var.location
  resource_group_name = var.resource_Group_Name
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  public_network_enabled = var.public_network_enabled

  tags = var.tags
}

