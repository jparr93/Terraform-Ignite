module "apim" {
    source = "../modules/apiManagement"
location = azurerm_resource_group.networks.location
resource_Group_Name = azurerm_resource_group.networks.name
apim_config = var.apim_Config
apis =   var.apis
apim_backend = {
    name           = "backend1"
    protocol = "http"
    url = "https://jpwebapptest.azurewebsites.net"
    }
}