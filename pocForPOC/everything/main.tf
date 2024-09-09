module "virtual_network_default" {
  source = "../modules/virtualNetwork"
location = azurerm_resource_group.networks.location
resource_Group_Name = azurerm_resource_group.networks.name
virtual_Network_Name = "vnet2"
address_Space = var.addressSpaceDefault
subnets = var.subnets_default
network_Security_Group_Name = var.default_NSG_Name
route_table_name = "rt2d3"
}

module "virtual_network_peered" {
  source = "../modules/virtualNetwork"
location = azurerm_resource_group.networks.location
resource_Group_Name = azurerm_resource_group.networks.name
virtual_Network_Name = "vnet3"
address_Space = var.addressSpacePeered
subnets = var.subnets_peered
network_Security_Group_Name = var.peered_NSG_Name
route_table_name = "rt2d2"
}

resource "azurerm_virtual_network_peering" "peered_to_default" {
  name                      = "peer_${module.virtual_network_peered.virtual_network.name}_to_${module.virtual_network_default.virtual_network.name}"
  resource_group_name       = azurerm_resource_group.networks.name
  virtual_network_name      = module.virtual_network_peered.virtual_network.name
  remote_virtual_network_id = module.virtual_network_default.virtual_network.id
}

resource "azurerm_virtual_network_peering" "default_to_peered" {
  name                      = "peer_${module.virtual_network_default.virtual_network.name}_to_${module.virtual_network_peered.virtual_network.name}"
  resource_group_name       = azurerm_resource_group.networks.name
  virtual_network_name      = module.virtual_network_default.virtual_network.name
  remote_virtual_network_id = module.virtual_network_peered.virtual_network.id
}

/*module "vwan_hub" {
  source = "../modules/vwanHub"
location = azurerm_resource_group.networks.location
resource_Group_Name = azurerm_resource_group.networks.name
vwan_Name = "vwan1"
vwan_Hub_Name = "vwanhub1"
vwan_Hub_Address_Prefix = "10.10.20.0/24"
}*/