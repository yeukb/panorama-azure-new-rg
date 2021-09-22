resource "azurerm_network_security_group" "panorama" {
  name                = "${var.virtualMachineName}-nsg"
	location            = azurerm_resource_group.main.location
	resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = azurerm_network_interface.panorama.private_ip_address
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = azurerm_network_interface.panorama.private_ip_address
  }

  security_rule {
    name                       = "allow_cortex"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "444"
    source_address_prefix      = "*"
    destination_address_prefix = azurerm_network_interface.panorama.private_ip_address
  }

  security_rule {
    name                       = "allow_fw"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3978"
    source_address_prefix      = "*"
    destination_address_prefix = azurerm_network_interface.panorama.private_ip_address
  }

  security_rule {
    name                       = "allow_fw_updates"
    priority                   = 140
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "28443"
    source_address_prefix      = "*"
    destination_address_prefix = azurerm_network_interface.panorama.private_ip_address
  }

  tags = {
    StoreStatus     = "DND"
    application     = "Panorama"
  }
}

resource "azurerm_network_interface_security_group_association" "panorama" {
  network_interface_id      = azurerm_network_interface.panorama.id
  network_security_group_id = azurerm_network_security_group.panorama.id

  depends_on = [
    azurerm_network_security_group.panorama,
    azurerm_network_interface.panorama
  ] 
}