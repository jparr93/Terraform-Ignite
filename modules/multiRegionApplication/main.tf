resource "azurerm_traffic_manager_profile" "example" {
  name                   = var.traffic_Manager["name"]
  resource_group_name    = var.resource_Group_Name
  traffic_routing_method = var.traffic_Manager["routing_Method"]

  dns_config {
    relative_name = var.traffic_Manager["name"]
    ttl           = var.traffic_Manager["ttl"]
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