module "storage_account" {
  source = "git::https://github.com/mikerodionov/terraform-azurerm-avm-res-storage-storageaccount.git?ref=v0.5.0"

  #####################################
  # variables.tf
  #####################################
  customer_managed_key                     = var.customer_managed_key
  enable_telemetry                         = var.enable_telemetry
  location                                 = var.location
  lock                                     = var.lock
  managed_identities                       = var.managed_identities
  name                                     = var.name
  private_endpoints                        = var.private_endpoints
  private_endpoints_manage_dns_zone_group = var.private_endpoints_manage_dns_zone_group
  resource_group_name                      = var.resource_group_name
  role_assignments                         = var.role_assignments
  tags                                     = var.tags

  #####################################
  # variables.storageaccount.tf
  #####################################
  access_tier                       = var.access_tier
  account_kind                      = var.account_kind
  account_replication_type          = var.account_replication_type
  account_tier                      = var.account_tier
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  allowed_copy_scope                = var.allowed_copy_scope
  azure_files_authentication        = var.azure_files_authentication
  blob_properties                   = var.blob_properties
  cross_tenant_replication_enabled  = var.cross_tenant_replication_enabled
  custom_domain                     = var.custom_domain
  default_to_oauth_authentication   = var.default_to_oauth_authentication
  edge_zone                         = var.edge_zone
  https_traffic_only_enabled        = var.https_traffic_only_enabled
  immutability_policy               = var.immutability_policy
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  is_hns_enabled                    = var.is_hns_enabled
  large_file_share_enabled          = var.large_file_share_enabled
  local_user                        = var.local_user
  min_tls_version                   = var.min_tls_version
  network_rules                     = var.network_rules
  nfsv3_enabled                     = var.nfsv3_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  queue_encryption_key_type         = var.queue_encryption_key_type
  routing                           = var.routing
  sas_policy                        = var.sas_policy
  sftp_enabled                      = var.sftp_enabled
  shared_access_key_enabled         = var.shared_access_key_enabled
  share_properties                  = var.share_properties
  static_website                    = var.static_website
  table_encryption_key_type         = var.table_encryption_key_type
  timeouts                          = var.timeouts

  #####################################
  # variables.container.tf
  #####################################
  containers = var.containers

  #####################################
  # variables.data_lake.tf
  #####################################
  storage_data_lake_gen2_filesystem = var.storage_data_lake_gen2_filesystem

  #####################################
  # variables.diagnostics.tf
  #####################################
  diagnostic_settings_blob            = var.diagnostic_settings_blob
  diagnostic_settings_file            = var.diagnostic_settings_file
  diagnostic_settings_queue           = var.diagnostic_settings_queue
  diagnostic_settings_storage_account = var.diagnostic_settings_storage_account
  diagnostic_settings_table           = var.diagnostic_settings_table

  #####################################
  # variables.management_policy.tf
  #####################################
  storage_management_policy_rule     = var.storage_management_policy_rule
  storage_management_policy_timeouts = var.storage_management_policy_timeouts

  #####################################
  # variables.queue.tf
  #####################################
  queue_properties = var.queue_properties
  queues           = var.queues

  #####################################
  # variables.share.tf
  #####################################
  shares                     = var.shares

  #####################################
  # variables.table.tf
  #####################################
  tables                    = var.tables
}
