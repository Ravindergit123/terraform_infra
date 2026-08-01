variable "name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Resource Group location"
  type        = string
}

variable "tags" {
  description = "Resource Group tags"
  type        = map(string)
  default     = {}
}
