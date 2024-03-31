terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file in Azure
  backend "azurerm" {
    resource_group_name  = "haba_github_actions_terraform_rg"
    storage_account_name = "habaterraformgithub"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
    subscription_id      = "bd78e857-32b0-428f-95d9-c697d0b1ecce"
    tenant_id            = "6556067c-81a0-4056-b468-00ad9ee73d03"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
