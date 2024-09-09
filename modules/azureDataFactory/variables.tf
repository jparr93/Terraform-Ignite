variable "tags" {
  description = "Tags for infrastructure resources."
  type        = map
}
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

variable "data_Factory_Name" {
  description = "The name"
  type        = string
}

variable "public_network_enabled" {
  description = "The ..."
  type        = bool
  default     = true
}

variable "managed_virtual_network_enabled" {
  description = "The..."
  type        = bool
  default     = false
}