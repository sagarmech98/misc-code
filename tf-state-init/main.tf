provider "azurerm" {
  features {}
  subscription_id = "72129bc2-1be7-4c6e-971e-9375ebd6c232"
}


resource "azurerm_storage_account" "tfstate" {
  name                     = "stgdevtfstates"
  resource_group_name      = "Project"
  location                 = "Uk west"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}