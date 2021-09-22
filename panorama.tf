# Create Panorama
resource "azurerm_linux_virtual_machine" "panorama" {
  name                  = var.virtualMachineName
  computer_name         = var.virtualMachineName
	location              = azurerm_resource_group.main.location
	resource_group_name   = azurerm_resource_group.main.name
  size                  = var.virtualMachineSize
  network_interface_ids = [azurerm_network_interface.panorama.id]

  disable_password_authentication = false
  admin_username                  = var.adminUsername
  admin_password                  = var.adminPassword

  os_disk {
    name                 = "${var.virtualMachineName}-osdisk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "paloaltonetworks"
    offer     = "panorama"
    sku       = "byol"
    version   = var.panoramaVersion
  }

  plan {
    name      = "byol"
    publisher = "paloaltonetworks"
    product   = "panorama"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  }

  tags = {
    RunStatus       = "NOSTOP"
    StoreStatus     = "DND"
    application     = "Panorama"
  }

  depends_on = [
    azurerm_network_interface.panorama,
    azurerm_storage_account.mystorageaccount
  ]
}
