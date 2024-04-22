module "app_Service_Default" {
  source = "./modules/appService"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
app_Service_Plan_Name = var.app_Service_Plan_Name
app_Services = var.app_Services
}

module "service_bus_Default" {
  source = "./modules/serviceBus"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
service_bus_name = var.service_Bus_Name
service_Bus_Sku = var.service_Bus_Sku
topics = var.service_Bus_Topics
queues = var.service_Bus_Queues
}