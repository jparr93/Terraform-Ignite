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

variable "traffic_Manager" {
  description = "Object detailing the plan, if creating one with this module."
  type = object({
    name           = optional(string)
    ttl            = optional(string)
    routing_Method = optional(string)
  })
  default = {}
}

variable "traffic_Manager_Endpoint" {
  
}