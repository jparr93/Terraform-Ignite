resource "azurerm_app_service_plan" "main" {
  name                = var.app_Service_Plan_Name
  location            = var.location
  resource_group_name = var.resource_Group_Name
  
  sku{
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  for_each = var.app_Services
  name                = each.value["name"]
  location            = var.location
  resource_group_name = var.resource_Group_Name
  app_service_plan_id = azurerm_app_service_plan.main.id
}