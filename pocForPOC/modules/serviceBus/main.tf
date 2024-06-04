resource "azurerm_servicebus_namespace" "main" {
  name                = var.service_bus_name
  resource_group_name = var.resource_Group_Name
  location            = var.location
  sku                 = var.service_Bus_Sku

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_queue" "main" {
  for_each = { for each in var.queues : each.name => each }
  name         = each.value.name
  namespace_id = azurerm_servicebus_namespace.main.id

   enable_partitioning = each.value.enable_partitioning

}
 
resource "azurerm_servicebus_topic" "example" {
  for_each = { for each in var.topics : each.name => each }
  name         = each.value.name
  namespace_id = azurerm_servicebus_namespace.main.id

  enable_partitioning = each.value.enable_partitioning
  max_size_in_megabytes = each.value.max_size_in_megabytes
  support_ordering = each.value.supports_ordering
}