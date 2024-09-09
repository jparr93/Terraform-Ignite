resource "azurerm_mssql_managed_instance" "main" {
  name                = var.instance_Config["name"]
  resource_group_name = var.resource_Group_Name
  location            = var.location

  license_type       = var.instance_Config["license_type"]
  sku_name           = var.instance_Config["sku_name"]
  storage_size_in_gb = var.instance_Config["storage_size_in_gb"]
  subnet_id          = "${var.instance_vnet_id}/subnets/${var.instance_Config["subnet_name"]}"
  vcores             = var.instance_Config["vcores"]

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_managed_database" "main" {
        for_each = { for each in var.databases : each.name => each }
  managed_instance_id = azurerm_mssql_managed_instance.main.id
  name                    = each.value.name
 # collation = each.value.collation
  #edition = each.value.edition
  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}