### Resource Group ### 

variable "resourceGroupPrefix" {
  type = string
  default = "rg"
}
variable "managementResourceGroup"{
    type = object({
             name = string, 
             location = string
 })
}
variable "networksResourceGroup"{
    type = object({
             name = string, 
             location = string
 })
}

variable "apis" {
  type = list(object({
    name = string
    revision = string
    display_name = string
    path = string
    protocols = list(any)
  }))
}

variable "apim_Config" {
    description = "Object detailing the APIM Config"
    type = object({
    name           = string
    publisher_name = string
    publisher_email = string
    sku_name        = string
    })
}