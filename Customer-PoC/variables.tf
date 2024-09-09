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

variable "network_security_rules" {
  type = list(object({
    name = string
    priority = number
    direction = string
    access = string
    protocol = string
    source_port_range = string
    destination_port_ranges = optional(list(string))
    destination_port_range = optional(string)
    source_address_prefix = string
    destination_address_prefix = string
  }))
  default = []
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

###  SQL Server ###
variable "sql_Server" {
  description = "Object detailing the SQL Server, if creating one"
    type = object({
        name        = string
        version     = string
    })
}

variable "azure_sql_databases"{
    type = list(object({
    name = string
    edition = string
    collation = string
  }))
}

variable "administrator_login" {
  type = string
  default = "adminjoe"
}

variable "administrator_login_password" {
  type = string
  sensitive = true
  default = "P@55w0rd!!!!!"
}

### Sql managed instance ###
variable "instance_Config" {
    description = "Object detailing the SQL Server managed instance, if creating one"
    type = object({
        create              = optional(bool, true)
        id                  = optional(string)
        name                = optional(string)
        license_type        = optional(string)
        sku_name            = optional(string)
        storage_size_in_gb  = optional(number)
        subnet_name         = optional(string)
        virtual_network_id  = optional(string)
        vcores              = optional(number)
    })
}

variable "sql_mi_databases"{
    type = list(object({
    name = string
  }))
}