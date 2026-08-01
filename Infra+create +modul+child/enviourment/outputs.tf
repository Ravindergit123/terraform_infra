output "resource_group_name" {
  description = "Name of deployed Resource Group"
  value       = module.resource_group.resource_group.name
}

output "vnet_id" {
  description = "ID of deployed Virtual Network"
  value       = module.vnet.vnet.id
}

output "subnet_id" {
  description = "ID of deployed Subnet"
  value       = module.subnet.subnet.id
}

