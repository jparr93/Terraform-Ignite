resource "azurerm_virtual_wan" "main" {
  name                = var.vwan_Name
  resource_group_name = var.resource_Group_Name
  location            = var.location
}

resource "azurerm_virtual_hub" "main" {
  name                = var.vwan_Hub_Name
  resource_group_name = var.resource_Group_Name
  location            = var.location
  virtual_wan_id      = azurerm_virtual_wan.main.id
  address_prefix      = var.vwan_Hub_Address_Prefix
}