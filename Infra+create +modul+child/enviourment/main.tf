resource "random_password" "vm_password" {
  count = length(keys(var.linux_vms))
  length           = 16
  special          = true
  override_special = "!@#$%&*"
}

locals {
  linux_vm_keys    = keys(var.linux_vms)
  linux_vm_indices = { for idx, key in local.linux_vm_keys : key => idx }
}

module "resource_group" {
  source   = "../Module/Resource_group"
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.resource_group_tags
}

module "vnet" {
  depends_on           = [module.resource_group]
  source               = "../Module/Vnet"
  name                 = var.vnet_name
  address_space        = var.vnet_address_space
  location             = var.vnet_location
  resource_group_name  = var.vnet_resource_group_name
  tags                 = var.vnet_tags
}

module "subnet" {
  depends_on            = [module.vnet]
  source                = "../Module/Subnet"
  name                  = var.subnet_name
  resource_group_name   = var.subnet_resource_group_name
  virtual_network_name  = var.subnet_virtual_network_name
  address_prefixes      = var.subnet_address_prefixes
}

