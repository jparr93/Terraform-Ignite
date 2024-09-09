resource "azurerm_sql_server" "main" {
  name                         = var.server["name"]
  resource_group_name          = var.resource_Group_Name
  location                     = var.location
  version                      = var.server["version"]
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = var.tags

}

resource "azurerm_sql_database" "example" {
      for_each = { for each in var.databases : each.name => each }
  name                = each.value.name
  resource_group_name = var.resource_Group_Name
  location            = var.location
  server_name         = azurerm_sql_server.main.name

  collation = each.value.collation
  

  tags = var.tags
}