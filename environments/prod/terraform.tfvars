environment = "prod"

rgs = {
  rg1 = {
    name     = "rg1-prod-pankaj"
    location = "East US"
  }
}

vnets = {
  vnet1 = {
    name               = "hub-vnet"
    resource_group_key = "rg1"
    address_space      = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name             = "subnet1"
    vnet_key         = "vnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
}
