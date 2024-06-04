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

variable "virtual_Network_Name" {
  description = "The name of the VNET"
  type        = string
  default     = "vnet1"
}

variable "subnets"{
    type = map(any)
    default = {
      subnet1 = {
        name = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
}

variable "network_Security_Group_Name" {
  description = "The name of the VNET"
  type        = string
  default     = "nsg1"
}

variable "route_table_name" {
  description = "The name of the VNET"
  type        = string
  default     = "nsg1"
}

variable "address_Space" {
  description = "The name of the VNET"
  type        = list
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "The name of the VNET"
  type        = list
  default     = ["10.1.1.12"]
}

