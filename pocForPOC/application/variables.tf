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


variable "plan" {
  description = "Object detailing the plan, if creating one with this module."
  type = object({
    create         = optional(bool, true)
    id             = optional(string)
    name           = optional(string)
    sku_name       = optional(string, "B1")
    zone_balancing = optional(bool, true)
  })
}

variable "appService" {
  type = object({
    name = string
    appSettings = optional(map(any))
  })
}

variable "server" {
    description = "Object detailing the SQL Server, if creating one"
    type = object({
        create      = optional(bool, true)
        id          = optional(string)
        name        = optional(string)
        version     = optional(string)
    })
}

variable "administrator_login" {
    description = "Username for SQL server"
    type = string
    default = "azureadmin"
}

variable "administrator_login_password" {
    description = "Password for SQL server"
    type = string
    default = "P@55w0rd!!!!!"
}

variable "database" {
  type = object({
    name = string
    edition = optional(string)
    collation = optional(string)
  })
}

variable "storageAccount" {
  description = "Object detailing the plan, if creating one with this module."
  type = object({
    name           = optional(string)
    account_tier   = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    account_kind = optional(string, "StorageV2")
    access_tier = optional(string, "Hot")
    shareName = optional(string, "Share")
    shareQuota = optional(number, 50)
  })
}