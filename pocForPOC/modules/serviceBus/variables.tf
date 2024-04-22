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

variable "service_bus_name" {
  description = "The name of the service bus namespace"
  type        = string
  default     = "sbjp1"
}

variable "service_Bus_Sku" {
  description = "The sku of the service bus"
  type        = string
  default     = "Standard"
}

variable "topics"{
    type = map(any)
    default = {
      topic1 = {
        name = "topic1"
        enable_partitioning = true
        max_size_in_megabytes = "10"
        supports_ordering = true
      }
    }
}

variable "queues"{
    type = map(any)
    default = {
      queue1 = {
        name = "queue1"
        enable_partitioning = true
      }
    }
}