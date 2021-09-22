terraform {
  required_version = "~> 1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.70.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Creating random string for use in Storage Account name and DNS Label
resource "random_id" "randomId" {
  keepers = {
      resource_group = azurerm_resource_group.main.name
  }
  byte_length = 2
}
