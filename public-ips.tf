#### CREATE PUBLIC IP ADDRESSES ####
resource "azurerm_public_ip" panorama {
	name                = "${var.virtualMachineName}-pip"
	location			= azurerm_resource_group.main.location
	resource_group_name	= azurerm_resource_group.main.name
	allocation_method   = "Static"
	sku					= "Standard"
	domain_name_label	= "${var.virtualMachineName}-${random_id.randomId.hex}"

  tags = {
    StoreStatus     = "DND"
    application     = "Panorama"
  }
}