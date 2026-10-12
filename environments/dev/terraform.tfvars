environment = "dev"

rgs = {
  rg1 = {
    name     = "JSR-001-Azure-INT-RG-Hub"
    location = "Central India"
  }

  rg2 = {
    name     = "JSR-002-Azure-INT-RG-App"
    location = "Central India"
  }
}

vnets = {
  vnet1 = {
    name               = "JSR-001-Azure-INT-VNet-Hub"
    resource_group_key = "rg1"
    address_space      = ["10.0.0.0/16"]
  }

  vnet2 = {
    name               = "JSR-002-Azure-INT-VNet-App"
    resource_group_key = "rg2"
    address_space      = ["10.1.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name             = "snet-hub-workload"
    vnet_key         = "vnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet2 = {
    name             = "snet-app-workload"
    vnet_key         = "vnet2"
    address_prefixes = ["10.1.1.0/24"]
  }
}
