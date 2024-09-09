variable "location" {
  description = "The location of created resources."
  type        = string
}

variable "resource_Group_Name" {
  description = "The resource group of created resources."
  type        = string
}

variable "instance_Config" {
    description = "Object detailing the SQL Server managed instance, if creating one"
    type = object({
        create              = optional(bool, true)
        id                  = optional(string)
        name                = optional(string)
        license_type        = optional(string)
        sku_name            = optional(string)
        storage_size_in_gb  = optional(number)
        subnet_name         = optional(string)
        virtual_network_id  = optional(string)
        vcores              = optional(number)
    })
    default = {}
}

variable "instance_vnet_id" {
  description = "String detailing the SQL Server managed instances vnet, if creating one"
  type = string
}

variable "administrator_login" {
    description = "Username for SQL server"
    type = string
    default = "admin"
}

variable "administrator_login_password" {
    description = "Password for SQL server"
    type = string
    default = "password"
}

variable "databases" {
  type = list(object({
    name = string
  }))
  default = []
}

variable "tags" {
  type = object({
  })
  default = {
  }
}