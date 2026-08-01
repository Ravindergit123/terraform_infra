variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "b4ae5a45-b36d-445c-99a5-c39ef04e44dc"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "resource_group_location" {
  description = "Resource Group location"
  type        = string
}

variable "resource_group_tags" {
  description = "Resource Group tags"
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  type        = list(string)
}

variable "vnet_location" {
  description = "Virtual Network location"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "Resource Group name for the Virtual Network"
  type        = string
}

variable "vnet_tags" {
  description = "Virtual Network tags"
  type        = map(string)
  default     = {}
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_resource_group_name" {
  description = "Resource Group name for the subnet"
  type        = string
}

variable "subnet_virtual_network_name" {
  description = "Virtual Network name for the subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
}

variable "key_vaults" {
  description = "Key Vault definitions"
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    sku_name                   = optional(string, "standard")
    soft_delete_retention_days = optional(number, 7)
    purge_protection_enabled   = optional(bool, false)
    rbac_authorization_enabled = optional(bool, false)
    tags                       = optional(map(string))
  }))
  default = {}
}

variable "key_vault_secrets" {
  description = "Static secret definitions (name, value, key_vault_key)"
  type = map(object({
    name          = string
    value         = string
    key_vault_key = string
  }))
  default = {}
}

variable "linux_vms" {
  description = "Linux Virtual Machine definitions"
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    subnet_key                        = string
    size                              = optional(string, "Standard_B2s")
    admin_username                    = optional(string, "azureuser")
    admin_password                    = optional(string, null)
    disable_password_authentication   = optional(bool, true)
    ssh_public_key                    = optional(string, null)
    enable_public_ip                  = optional(bool, true)
    pip_allocation_method             = optional(string, "Static")
    allowed_ssh_source_address_prefix = optional(string, "*")
    os_disk_caching                   = optional(string, "ReadWrite")
    os_disk_type                      = optional(string, "Standard_LRS")
    os_disk_size_gb                   = optional(number, 30)
    image_publisher                   = optional(string, "Canonical")
    image_offer                       = optional(string, "0001-com-ubuntu-server-jammy")
    image_sku                         = optional(string, "22_04-lts-gen2")
    image_version                     = optional(string, "latest")
    custom_data                       = optional(string, null)
    tags                              = optional(map(string))
  }))
}
