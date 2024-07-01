resource "azurerm_traffic_manager_profile" "example" {
  name                   = var.trafficManager["name"]
  resource_group_name    = azurerm_resource_group.example.name
  traffic_routing_method = var.trafficManager["routing_Method"]

  dns_config {
    relative_name = var.trafficManager["name"]
    ttl           = var.trafficManager["ttl"]
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "example" {
  name                 = "example-endpoint"
  profile_id           = azurerm_traffic_manager_profile.example.id
  always_serve_enabled = true
  weight               = 100
  target_resource_id   = azurerm_public_ip.example.id
}