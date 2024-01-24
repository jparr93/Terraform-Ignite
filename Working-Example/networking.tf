resource "azurerm_network_security_group" "example" {
  name                = "nsg1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.2"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  resource_group_name = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  name           = each.value["name"]
    address_prefixes = each.value["address_prefixes"]
}

module "routeTable" {
source = "git::https://github.com/ans-coe/terraform-modules.git//azure//route-table"

resource_group_name = azurerm_resource_group.example.name
subnet_ids = [azurerm_subnet.subnet["subnet1"].id]
name = "subnetRTModule"
default_route_ip = "10.2.3.4"

tags = local.tags
}

