resource "azurerm_public_ip" "main" {
  name                = var.bastion_Host_Public_Ip_Name
  resource_group_name = var.resource_Group_Name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_bastion_host" "main" {
  name                = var.bastion_Host_Name
  resource_group_name = var.resource_Group_Name
  location            = var.location

  ip_configuration {
    name                 = var.bastion_Host_Config
    subnet_id            = var.bastion_Host_Subnet_Id
    public_ip_address_id = azurerm_public_ip.main.id
  }
}