#### CREATE THE NETWORK INTERFACES ####

resource "azurerm_network_interface" "panorama" {
	name				= "${var.virtualMachineName}-eth0"
	location            = azurerm_resource_group.main.location
	resource_group_name = azurerm_resource_group.main.name

	ip_configuration {
		name							= "${var.virtualMachineName}-eth0"
		subnet_id						= azurerm_subnet.panorama.id
		private_ip_address_allocation 	= "Dynamic"
		public_ip_address_id            = azurerm_public_ip.panorama.id
	}

  	tags = {
    	StoreStatus     = "DND"
    	application     = "Panorama"
  	}
	
	depends_on = [azurerm_public_ip.panorama]
}
