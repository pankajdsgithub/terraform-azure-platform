environment = "qa"

rgs = {
  rg1 = {
    name     = "rg1-qa"
    location = "East US"
  }
  rg2 = {
    name     = "rg2-qa"
    location = "West US"
  }
}

vnets = {
  vnet1 = {
    name               = "hub-vnet"
    resource_group_key = "rg1"
    address_space      = ["10.10.0.0/16"]
  }
  vnet2 = {
    name               = "app-vnet"
    resource_group_key = "rg2"
    address_space      = ["10.11.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name             = "subnet1"
    vnet_key         = "vnet1"
    address_prefixes = ["10.10.1.0/24"]
  }
  subnet2 = {
    name             = "subnet2"
    vnet_key         = "vnet2"
    address_prefixes = ["10.11.1.0/24"]
  }
}
