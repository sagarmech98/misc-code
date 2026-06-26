provider "azurerm" {
  features {}
  subscription_id = "0c682c46-356a-40af-9528-6df4181da743"
}


terraform {
  backend "azurerm" {
    subscription_id      = "0c682c46-356a-40af-9528-6df4181da743"
    resource_group_name  = "Project"
    storage_account_name = "stgdevtfstates"
    container_name       = "roboshop-state-files"
    key                  = "tools.terraform.tfstate"
  }
}