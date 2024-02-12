### Resource Group ### 

variable "resourceGroupPrefix" {
  type = string
  default = "rg"
}
variable "managementResourceGroup"{
    type = object({
             name = string, 
             location = string
 })
}
variable "networksResourceGroup"{
    type = object({
             name = string, 
             location = string
 })
}

### Default Networking ### 

variable "default_Virtual_Network_Name" {
  type = string
  default = "vnet1"
}

variable "addressSpaceDefault" {
  type = list
  default = ["10.1.0.0/16"]
}
variable "subnets_default"{
    type = map(any)
    default = {
      subnet1 = {
        name = "subnet1"
        address_prefixes = ["10.1.1.0/24"]
      }
      subnet2 = {
        name = "subnet2"
        address_prefixes = ["10.1.2.0/24"]
      }
    }
}

variable "default_NSG_Name" {
  type = string
  default = "nsg1"
}

### Peered Networking ###

variable "peered_Virtual_Network_Name" {
  type = string
  default = "vnetA"
}
variable "subnets_peered"{
    type = map(any)
    default = {
      subnet1 = {
        name = "subnetA"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name = "subnetB"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
}

variable "addressSpacePeered" {
  type = list
  default = ["10.0.0.0/16"]
}

variable "peered_NSG_Name" {
  type = string
  default = "nsg2"
}

### Management ###
variable "storage_Account_Name" {
  type = string
  default = "sajppoc"
}

variable "storage_Account_Unique_Id" {
  type = string
  default = "1122"
}

variable "log_Workspace_Name" {
  type = string
  default = "log-jp-23"
}




