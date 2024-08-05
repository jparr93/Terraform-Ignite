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

variable "bastion_Host_Public_Ip_Name" {
  description = "The name of the storage account"
  type        = string
  default     = "pip-bas-01"
}

variable "bastion_Host_Name" {
  description = "The tier of the storage account"
  type        = string
  default     = "bst-prd-uks"
}

variable "bastion_Host_Config" {
  description = "The replication type of the storage account"
  type        = string
  default     = "bast-config"
}

variable "bastion_Host_Subnet_Id" {
  description = "The kind of storage account"
  type        = string
}