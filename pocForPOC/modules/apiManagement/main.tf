resource "azurerm_api_management" "main" {
  name                = var.apim_config["name"]
  location            = var.location
  resource_group_name = var.resource_Group_Name
  publisher_name      = var.apim_config["publisher_name"]
  publisher_email     = var.apim_config["publisher_email"]

  sku_name = var.apim_config["sku_name"]

}

resource "azurerm_api_management_api" "main" {
    for_each = { for each in var.apis : each.name => each }
  name                = each.value.name
  resource_group_name = var.resource_Group_Name
  api_management_name = azurerm_api_management.main.name
  revision            = each.value.revision
  display_name        = each.value.display_name
  path                = each.value.path
  protocols           = each.value.protocols
}