resource "azurerm_resource_group" "example" {
  name     = "rg-uks-tf"
  location = "Uk South"
}

resource "azurerm_resource_group" "default" {
  name = "${var.resourceGroupPrefix}-${var.resourceGroupDefault.name}"
  location = var.resourceGroupDefault.location
}