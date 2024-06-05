module "naming" {
  source  = "Azure/naming/azurerm"
  prefix  = ["sa","uks"]
  suffix  = ["sol"]
}

locals {
  # Common tags to be assigned to all resources
  tags = {
    Service = "SOL"
    Owner   = "JP"
  }
}

module "storage_account_Default" {
  source = "../modules/storageAccount"
location = azurerm_resource_group.management.location
resource_Group_Name = azurerm_resource_group.management.name
storage_account_name = module.naming.storage_account.name_unique
tags = local.tags
}