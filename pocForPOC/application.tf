module "app_Service_Default" {
  source = "./modules/appService"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
app_Service_Plan_Name = var.app_Service_Plan_Name
app_Services = var.app_Services
}