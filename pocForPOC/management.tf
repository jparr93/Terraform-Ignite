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

 module "azure_Bastion_Default" {
  source = "./modules/azureBastion"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
bastion_Host_Name =  var.bastion_Host_Name
bastion_Host_Config = var.bastion_Host_Config
bastion_Host_Public_Ip_Name = var.bastion_Host_Public_Ip_Name
bastion_Host_Subnet_Id = "${module.virtual_network_default.virtual_network.id}/subnets/AzureBastionSubnet"
}