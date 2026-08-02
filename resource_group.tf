resource "azurerm_resource_group" "ravi_rg" {
  name     = "ravinder-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "ravi_sa" {
  name                     = "ravindersa"
  resource_group_name      = azurerm_resource_group.ravi_rg.name
  location                 = azurerm_resource_group.ravi_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}