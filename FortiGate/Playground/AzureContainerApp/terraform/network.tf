##############################################################################################################
#
# FortiGate VM
# Terraform deployment template for Microsoft Azure
#
##############################################################################################################
#
# Deployment of the virtual network
#
##############################################################################################################

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-VNET"
  address_space       = [var.vnet]
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.prefix}-SUBNET-EXTERNAL"
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet["1"]]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "${var.prefix}-SUBNET-INTERNAL"
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet["2"]]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "${var.prefix}-SUBNET-ACA"
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet["3"]]
}
