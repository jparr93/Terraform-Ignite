terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
  subscription_id = "d4fefdc2-b691-4e9f-b797-983233951e38"
}
