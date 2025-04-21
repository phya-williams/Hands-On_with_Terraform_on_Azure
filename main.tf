terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "pspworg"

    workspaces {
      name = "Hands-On_with_Terraform_on_Azure"
    }
  }
}

provider "azurerm" {
  subscription_id = "9734ed68-621d-47ed-babd-269110dbacb1"
  features {

  }
  skip_provider_registration = true
  use_cli = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-d0e02cae-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}
module "securestorage" {
  source               = "app.terraform.io/pspworg/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "pspwcloudstorage"
}
