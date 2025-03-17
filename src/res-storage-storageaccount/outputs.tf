output "containers" {
  description = "Map of storage containers that are created."
  value       = module.storage_account.containers
}

output "fqdn" {
  description = "Fqdns for storage services."
  value       = module.storage_account.fqdn
}

output "name" {
  description = "The name of the storage account"
  value       = module.storage_account.name
}

output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = module.storage_account.private_endpoints
}

output "queues" {
  description = "Map of storage queues that are created."
  value       = module.storage_account.queues
}

output "resource" {
  description = "This is the full resource output for the Storage Account resource."
  sensitive   = true
  value       = module.storage_account.resource
}

output "resource_id" {
  description = "The ID of the Storage Account."
  value       = module.storage_account.resource_id
}

output "shares" {
  description = "Map of storage storage shares that are created."
  value       = module.storage_account.shares
}

output "tables" {
  description = "Map of storage tables that are created."
  value       = module.storage_account.tables
}
