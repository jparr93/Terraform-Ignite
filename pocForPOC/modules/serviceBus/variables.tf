variable "location" {
  description = "The location of created resources."
  type        = string
}

variable "resource_Group_Name" {
  description = "The resource group of created resources."
  type        = string
}

variable "service_bus_name" {
  description = "The name of the service bus namespace"
  type        = string
}

variable "service_Bus_Sku" {
  description = "The sku of the service bus"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.service_Bus_Sku)
    error_message = "Sku must be of Standard or Premium"
  }
}

variable "topics"{
    type = list(object({
        name = string
        enable_partitioning = bool
        max_size_in_megabytes = string
        supports_ordering = bool
    }))
    default = []
    }

variable "queues"{
    type = list(object({
        name = string
        enable_partitioning = bool
    }))
    default = []
}