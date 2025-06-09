provider "azurerm" {
  features {}
  subscription_id = "72129bc2-1be7-4c6e-971e-9375ebd6c232"
}


terraform {
  backend "azurerm" {
    subscription_id      = "72129bc2-1be7-4c6e-971e-9375ebd6c232"
    resource_group_name  = "Project"
    storage_account_name = "stgdevtfstates"
    container_name       = "roboshop-state-files"
    key                  = "tools.terraform.tfstate"
  }
}