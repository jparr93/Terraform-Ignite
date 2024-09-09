module "app_Service_Default" {
  source = "../modules/appService"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
app_Service_Plan_Name = var.app_Service_Plan_Name
apps = var.apps
}

module "service_bus_Default" {
  source = "../modules/serviceBus"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
service_bus_name = var.service_Bus_Name
service_Bus_Sku = var.service_Bus_Sku
topics = var.service_Bus_Topics
queues = var.service_Bus_Queues
}

module "sql_Server" {
  source = "../modules/sqlServer"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
server = var.sql_Server
databases = var.databases
administrator_login =  var.administrator_login
administrator_login_password = var.administrator_login_password
}

module "sql_Mi" {
  source = "../modules/sqlManagedInstance"
  depends_on = [ module.virtual_network_peered ]
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
instance_Config = var.instance_Config
instance_vnet_id = module.virtual_network_peered.virtual_network.id
administrator_login =  var.administrator_login
administrator_login_password = var.administrator_login_password
}

