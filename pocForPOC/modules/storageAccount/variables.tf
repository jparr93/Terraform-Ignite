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

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "satest2123ss"
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "The kind of storage account"
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "The access tier of the storage account"
  type        = string
  default     = "Hot"
}