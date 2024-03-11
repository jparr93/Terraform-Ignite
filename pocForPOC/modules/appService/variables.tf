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

variable "app_Service_Plan_Name" {
  description = "The name of the App Service Plan"
  type        = string
  default     = "asp-test"
}

variable "app_Service_Plan_SKU" {
   type = map(any)
    default = {
      default = {
        tier = "standard"
        size = "S1"
      }
    }
}

variable "app_Services"{
    type = map(any)
    default = {
      app1 = {
        name = "prod-jp-test23"
      }
      app2 = {
        name = "prod-jp-test24"
      }
    }
}