output "subnets" {
  description = "Created subnets keyed by logical name."
  value = {
    for key, subnet in azurerm_subnet.subnet : key => {
      id   = subnet.id
      name = subnet.name
    }
  }
}
