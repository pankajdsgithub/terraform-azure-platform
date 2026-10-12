terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 5.0.0"
    }
  }

  # Partial backend configuration: values are injected at `terraform init`
  # (by the pipeline, or with -backend-config flags locally). See README.
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate"
    container_name       = "tfstate"
    key                  = "qa-terraform.tfstate"
  }
}

# Subscription and credentials come from the service connection (ARM_* variables).
provider "azurerm" {
  features {}
}
