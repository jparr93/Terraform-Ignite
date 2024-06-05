resource "azurerm_resource_group" "networks" {
  name     = "${var.resourceGroupPrefix}-${var.networksResourceGroup.name}"
  location = var.networksResourceGroup.location
}

resource "azurerm_resource_group" "management" {
  name = "${var.resourceGroupPrefix}-${var.managementResourceGroup.name}"
  location = var.managementResourceGroup.location
}