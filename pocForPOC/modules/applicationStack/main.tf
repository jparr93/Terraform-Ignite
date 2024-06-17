resource "azurerm_sql_server" "main" {
  name                         = var.server["name"]
  resource_group_name          = var.resource_Group_Name
  location                     = var.location
  version                      = var.server["version"]
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

}

resource "azurerm_sql_database" "main" {
  name                = var.database["name"]
  resource_group_name = var.resource_Group_Name
  location            = var.location
  server_name         = azurerm_sql_server.main.name

  collation = var.database["collation"]
  

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_account" "main" {
  name                     = var.storageAccount["name"]
  resource_group_name      = var.resource_Group_Name
  location                 = var.location
  account_tier             = var.storageAccount["account_tier"]
  account_replication_type = var.storageAccount["account_replication_type"]
  account_kind = var.storageAccount["account_kind"]
  access_tier = var.storageAccount["access_tier"]

 
  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_share" "example" {
  name                 = var.storageAccount["shareName"]
  storage_account_name = azurerm_storage_account.main.name
  quota                = var.storageAccount["shareQuota"]
}


resource "azurerm_service_plan" "main" {
    depends_on = [ azurerm_sql_database.main, azurerm_storage_share.example ]
  name                  = var.app_Service_Plan_Name
  location              = var.location
  resource_group_name   = var.resource_Group_Name
  
  sku_name               = var.plan["sku_name"]
  os_type                = var.os_type
  zone_balancing_enabled = var.plan["zone_balancing"]
}

resource "azurerm_app_service" "main" {

  name                = var.appService["name"]
  location            = var.location
  resource_group_name = var.resource_Group_Name
  app_service_plan_id = azurerm_service_plan.main.id

   app_settings = var.appService["appSettings"]

connection_string {
name  = "AZURE_SQL_CONNECTIONSTRING"
type  = "SQLAzure"
value = "Data Source=${azurerm_sql_server.main.name}.database.windows.net,1433;Initial Catalog=${azurerm_sql_database.main.name};User ID=${var.administrator_login};Password=${var.administrator_login_password}"
  }

storage_account {
  name = "string"
  type = "AzureFiles"
  account_name = azurerm_storage_account.main.name
  share_name = var.storageAccount["shareName"]
  access_key = azurerm_storage_account.main.primary_access_key
  mount_path = "/mounts/share"
    }
}