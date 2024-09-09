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

variable "server" {
    description = "Object detailing the SQL Server, if creating one"
    type = object({
        create      = optional(bool, true)
        id          = optional(string)
        name        = optional(string)
        version     = optional(string)
    })
    default = {}
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
    edition = optional(string)
    collation = optional(string)
  }))
  default = []
}

variable "tags" {
  type = object({
  })
  default = {
  }
}