resource "azurerm_resource_group" "rgs" {
  name     = var.name
  location = var.location
  tags     = try(var.tags, {})
}
