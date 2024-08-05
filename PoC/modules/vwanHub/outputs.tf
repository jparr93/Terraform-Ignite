output "vwan" {
  description = "The output of the vwan resource"
  value       = azurerm_virtual_wan.main
}

output "vwan_Hub" {
  description = "The output of the vwan resource"
  value       = azurerm_virtual_hub.main
}