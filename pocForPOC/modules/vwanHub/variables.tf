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

variable "vwan_Name" {
  description = "The name of the base vwan resource"
  type        = string
  default     = "vwan1"
}

variable "vwan_Hub_Name" {
  description = "The name of vwan connected hub"
  type        = string
  default     = "vwan1-hub"
}
variable "vwan_Hub_Address_Prefix" {
  description = "The IP range of vwan connected hub"
  type        = string
  default     = "10.10.10.0/24"
}