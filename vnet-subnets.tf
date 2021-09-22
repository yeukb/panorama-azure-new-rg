# ********** VNET **********

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name				        = var.virtualNetworkName
  location		        = azurerm_resource_group.main.location
  resource_group_name	= azurerm_resource_group.main.name
  address_space		    = [var.VNETaddressPrefix]

  tags = {
    StoreStatus     = "DND"
    application     = "Panorama"
  }
}

# Create the subnet
resource "azurerm_subnet" "panorama" {
  name                 = var.subnetName
  resource_group_name	 = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.SubnetPrefix]
}
