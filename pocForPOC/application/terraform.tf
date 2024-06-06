terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.3.2"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
  subscription_id = "afa1297c-9c28-4d1d-80e9-997b8e64e0fd"
}
