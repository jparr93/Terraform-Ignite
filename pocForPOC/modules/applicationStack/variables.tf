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

variable "os_type" {
  description = "Windows or Linux Web App"
  type        = string
  default = "Linux"

  validation {
    condition     = contains(["Windows", "Linux"], var.os_type)
    error_message = "OS Type must be Windows or Linux"
  }
}

variable "plan" {
  description = "Object detailing the plan, if creating one with this module."
  type = object({
    create         = optional(bool, true)
    id             = optional(string)
    name           = optional(string)
    sku_name       = optional(string, "B1")
    zone_balancing = optional(bool, true)
  })
  default = {}
}

variable "appService" {
  type = object({
    name = optional(string)
    appSettings = optional(map(any))
  })
  default = {}
}

variable "application_stack" {
  description = "An object detailing the application stack."
  type = object({
    docker_image_name        = optional(string)
    docker_registry_url      = optional(string)
    docker_registry_username = optional(string)
    docker_registry_password = optional(string)
    dotnet_version           = optional(string)
    java_version             = optional(string)
    node_version             = optional(string)
    php_version              = optional(string)

    ## Windows Only
    current_stack                = optional(string)
    dotnet_core_version          = optional(string)
    tomcat_version               = optional(string)
    java_embedded_server_enabled = optional(bool)
    python                       = optional(bool)

    ## Linux Only
    go_version          = optional(string)
    java_server         = optional(string)
    java_server_version = optional(string)
    python_version      = optional(string)
    ruby_version        = optional(string)
  })
  default = {
    docker_image_name   = "azure-app-service/samples/aspnethelloworld:latest"
    docker_registry_url = "https://mcr.microsoft.com"
  }
}

variable "site_config" {
  description = "An object with site config values."
  type = object({
    always_on                                     = optional(bool, false)
    api_definition_url                            = optional(string)
    api_management_api_id                         = optional(string)
    app_command_line                              = optional(string)
    container_registry_managed_identity_client_id = optional(string)
    container_registry_use_managed_identity       = optional(bool, true)
    default_documents                             = optional(list(string))
    health_check_eviction_time_in_min             = optional(number, 2)
    ftps_state                                    = optional(string)
    health_check_path                             = optional(string)
    http2_enabled                                 = optional(bool, false)
    load_balancing_mode                           = optional(string)
    local_mysql_enabled                           = optional(bool)
    managed_pipeline_mode                         = optional(string)
    minimum_tls_version                           = optional(string, "1.2")
    scm_minimum_tls_version                       = optional(string, "1.2")
    scm_use_main_ip_restriction                   = optional(bool)
    remote_debugging_enabled                      = optional(bool, false)
    remote_debugging_version                      = optional(string)
    use_32_bit_worker                             = optional(bool)
    vnet_route_all_enabled                        = optional(bool)
    websockets_enabled                            = optional(bool, false)
    worker_count                                  = optional(number, 1)
  })
  default = {}
}

variable "server" {
    description = "Object detailing the SQL Server, if creating one"
    type = object({
        create      = optional(bool, true)
        id          = optional(string)
        name        = optional(string)
        version     = optional(string)
    })
    default = {}
}

variable "administrator_login" {
    description = "Username for SQL server"
    type = string
    default = "azureadmin"
}

variable "administrator_login_password" {
    description = "Password for SQL server"
    type = string
    default = "password"
}

variable "database" {
  type = object({
    name = optional(string)
    edition = optional(string)
    collation = optional(string)
  })
  default = {}
}

variable "storageAccount" {
  description = "Object detailing the plan, if creating one with this module."
  type = object({
    name           = optional(string)
    account_tier   = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    account_kind = optional(string, "StorageV2")
    access_tier = optional(string, "Hot")
    shareName = optional(string, "Share")
    shareQuota = optional(number, 50)
  })
  default = {}
}