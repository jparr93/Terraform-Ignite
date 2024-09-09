resource "azurerm_service_plan" "main" {
  name                  = var.app_Service_Plan_Name
  location              = var.location
  resource_group_name   = var.resource_Group_Name
  
  sku_name               = var.plan["sku_name"]
  os_type                = var.os_type
  zone_balancing_enabled = var.plan["zone_balancing"]
}

resource "azurerm_app_service" "main" {
     for_each = { for each in var.apps : each.name => each }
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_Group_Name
  app_service_plan_id = azurerm_service_plan.main.id

   app_settings = each.value.app_settings
}
/* app_settings = contains(each.value, "app_settings") ? each.value.app_settings : {}*/