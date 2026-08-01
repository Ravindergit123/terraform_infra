variable "name" {
  description = "Subnet name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name for the subnet"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual Network name for the subnet"
  type        = string
}

variable "address_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
}