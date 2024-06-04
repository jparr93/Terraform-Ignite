resource "azurerm_network_security_group" "main" {
  name                = var.network_Security_Group_Name
  location            = var.location
  resource_group_name = var.resource_Group_Name
}

resource "azurerm_route_table" "main" {
  name = var.route_table_name
  location = var.location
  resource_group_name = var.resource_Group_Name  
}

resource "azurerm_virtual_network" "main" {
  name                = var.virtual_Network_Name
  location            = var.location
  resource_group_name = var.resource_Group_Name
  address_space       = var.address_Space
  dns_servers         = var.dns_servers


  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "main" {
  for_each = var.subnets
  resource_group_name = var.resource_Group_Name
  virtual_network_name = azurerm_virtual_network.main.name
  name           = each.value["name"]
    address_prefixes = each.value["address_prefixes"]
  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "main" {
  for_each = azurerm_subnet.main 
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_subnet_route_table_association" "example" {
  for_each = azurerm_subnet.main 
  subnet_id                 = each.value.id
  route_table_id = azurerm_route_table.main.id
}
 /*[module.network.subnets["snet-prod"].id]*/