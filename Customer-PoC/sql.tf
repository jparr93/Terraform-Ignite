module "sql_Server" {
  source = "../modules/sqlServer"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
server = var.sql_Server
databases = var.azure_sql_databases
administrator_login =  var.administrator_login
administrator_login_password = var.administrator_login_password

tags = local.tags
}

module "sql_Mi" {
  source = "../modules/sqlManagedInstance"
  depends_on = [ module.virtual_network_peered ]
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
instance_Config = var.instance_Config
instance_vnet_id = module.virtual_network_peered.virtual_network.id
administrator_login =  var.administrator_login
administrator_login_password = var.administrator_login_password
databases = var.sql_mi_databases

tags = local.tags
}

