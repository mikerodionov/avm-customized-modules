module "res-network-loadbalancer" {
  source = "git::https://github.com/mikerodionov/terraform-azurerm-avm-res-network-loadbalancer.git?ref=v0.4.0"

  # Variables to pass to the child module
  # main.tf
  location                                = var.location
  name                                    = var.name
  resource_group_name                     = var.resource_group_name
  edge_zone                               = var.edge_zone
  sku                                     = var.sku
  sku_tier                                = var.sku_tier
  tags                                    = var.tags
  frontend_subnet_resource_id             = var.frontend_subnet_resource_id
  backend_address_pools                   = var.backend_address_pools
  backend_address_pool_configuration      = var.backend_address_pool_configuration
  backend_address_pool_addresses          = var.backend_address_pool_addresses
  backend_address_pool_network_interfaces = var.backend_address_pool_network_interfaces
  lb_probes                               = var.lb_probes
  lb_rules                                = var.lb_rules
  lb_nat_rules                            = var.lb_nat_rules
  lb_outbound_rules                       = var.lb_outbound_rules
  lb_nat_pools                            = var.lb_nat_pools
  # main.locks.tf
  lock = var.lock
  # main.public_ip.tf
  public_ip_address_configuration = var.public_ip_address_configuration
  # main.role_assignments.tf
  role_assignments = var.role_assignments
  # main.diagnostic_settings.tf
  ### Azure Load Balancer diagnostic must be enabled
  ### You cannot disable logs but you can specify workspace, storage, and event hub
  frontend_ip_configurations = {
    for k, v in var.frontend_ip_configurations : k => merge(v, {
      diagnostic_settings = merge(
        v.diagnostic_settings != null ? v.diagnostic_settings : {},
        {
          name                                     = "mandatory-logs"
          log_categories                           = toset(["LoadBalancerProbeHealthStatus", "LoadBalancerAlertEvent"])
          log_groups                               = toset(["allLogs"])
          metric_categories                        = toset(["AllMetrics"])
          log_analytics_destination_type           = "Dedicated"
          workspace_resource_id                    = lookup(v.diagnostic_settings, "workspace_resource_id", null)
          storage_account_resource_id              = lookup(v.diagnostic_settings, "storage_account_resource_id", null)
          event_hub_authorization_rule_resource_id = lookup(v.diagnostic_settings, "event_hub_authorization_rule_resource_id", null)
          event_hub_name                           = lookup(v.diagnostic_settings, "event_hub_name", null)
        }
      )
    })
  }
}
