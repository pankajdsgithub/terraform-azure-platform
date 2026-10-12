locals {
  tags = merge(
    {
      environment = var.environment
      managed_by  = "terraform"
    },
    var.tags
  )
}

module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  rgs  = var.rgs
  tags = local.tags
}

# Dependencies are implicit: each module consumes the previous module's outputs.
module "virtual_network" {
  source = "../../modules/azurerm_virtual_network"

  vnets           = var.vnets
  resource_groups = module.resource_group.resource_groups
  tags            = local.tags
}

module "subnet" {
  source = "../../modules/azurerm_subnet"

  subnets          = var.subnets
  virtual_networks = module.virtual_network.virtual_networks
}
