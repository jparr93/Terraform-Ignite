output "app_service_Plan" {
  description = "The output of the route table resource."
  value       = azurerm_service_plan.main
}

output "app_services" {
  description = "App Services Output"
  value = azurerm_app_service.main
}