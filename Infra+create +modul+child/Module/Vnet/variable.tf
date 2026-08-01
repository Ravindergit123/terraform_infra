variable "name" {
  description = "Virtual Network name"
  type        = string
}

variable "address_space" {
  description = "Virtual Network address space"
  type        = list(string)
}

variable "location" {
  description = "Virtual Network location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name for the Virtual Network"
  type        = string
}

variable "tags" {
  description = "Virtual Network tags"
  type        = map(string)
  default     = {}
}