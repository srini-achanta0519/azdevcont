terraform {
  required_version = "~> 1.13.1"
  
  cloud {
    organization = "sriniachanta"
    workspaces {
      name = "azdevcont"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}