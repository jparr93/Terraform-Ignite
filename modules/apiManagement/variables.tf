variable "location" {
  description = "The location of created resources."
  type        = string
  default     = "uksouth"
}

variable "resource_Group_Name" {
  description = "The resource group of created resources."
  type        = string
  default     = "rg-networking"
}


variable "apim_config" {
  description = "APIM Configuration"
  type = object({
    name           = optional(string)
    publisher_name = string
    publisher_email = string
    sku_name        = string
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

variable "apim_backend" {
  description = "APIM Backend"
  type = object({
    name           = optional(string)
    protocol = string
    url = string
  })
}