resource "azurerm_api_management" "main" {
  name                = var.apim_config["name"]
  location            = var.location
  resource_group_name = var.resource_Group_Name
  publisher_name      = var.apim_config["publisher_name"]
  publisher_email     = var.apim_config["publisher_email"]

  sku_name = var.apim_config["sku_name"]

}

resource "azurerm_api_management_api" "main" {
    for_each = { for each in var.apis : each.name => each }
  name                = each.value.name
  resource_group_name = var.resource_Group_Name
  api_management_name = azurerm_api_management.main.name
  revision            = each.value.revision
  display_name        = each.value.display_name
  path                = each.value.path
  protocols           = each.value.protocols
}

resource "azurerm_api_management_backend" "main" {
  name                = var.apim_backend["name"]
  resource_group_name = var.resource_Group_Name
  api_management_name = azurerm_api_management.main.name
  protocol            = var.apim_backend["protocol"]
  url                 = var.apim_backend["url"]
}

resource "azapi_resource" "symbolicname" {
  type = "Microsoft.ApiManagement/service/apis@2023-05-01-preview"
}

resource "azapi_resource" "symbolicname" {
  type = "Microsoft.ApiManagement/service/backends@2023-05-01-preview"
  name = "string"
  parent_id = "string"
    body = jsonencode({
    properties = {
      circuitBreaker = {
        rules = [
          {
            failureCondition = {
              count = int
              errorReasons = [
                "string"
              ]
              interval = "string"
              percentage = int
              statusCodeRanges = [
                {
                  max = int
                  min = int
                }
              ]
            }
            name = "string"
            tripDuration = "string"
          }
        ]
      }
      credentials = {
        authorization = {
          parameter = "string"
          scheme = "string"
        }
        certificate = [
          "string"
        ]
        certificateIds = [
          "string"
        ]
        header = {
          {customized property} = [
            "string"
          ]
        }
        query = {
          {customized property} = [
            "string"
          ]
        }
      }
      description = "string"
      pool = {
        services = [
          {
            id = "string"
          }
        ]
      }
      properties = {
        serviceFabricCluster = {
          clientCertificateId = "string"
          clientCertificatethumbprint = "string"
          managementEndpoints = [
            "string"
          ]
          maxPartitionResolutionRetries = int
          serverCertificateThumbprints = [
            "string"
          ]
          serverX509Names = [
            {
              issuerCertificateThumbprint = "string"
              name = "string"
            }
          ]
        }
      }
      protocol = "string"
      proxy = {
        password = "string"
        url = "string"
        username = "string"
      }
      resourceId = "string"
      title = "string"
      tls = {
        validateCertificateChain = bool
        validateCertificateName = bool
      }
      type = "string"
      url = "string"
    }
  })
}