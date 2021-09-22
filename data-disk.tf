# Create Data Disk
resource "azurerm_managed_disk" "panorama_data_disk" {
  count = var.add_data_disk ? 1 : 0

  name                 = "${var.virtualMachineName}-datadisk1"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.DataDiskSizeInGB

  tags = {
    StoreStatus     = "DND"
    application     = "Panorama"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "panorama_disk_attachment" {
  count = var.add_data_disk ? 1 : 0

  managed_disk_id    = azurerm_managed_disk.panorama_data_disk[0].id
  virtual_machine_id = azurerm_linux_virtual_machine.panorama.id
  lun                = "0"
  caching            = "ReadWrite"

  depends_on = [
    azurerm_managed_disk.panorama_data_disk,
    azurerm_linux_virtual_machine.panorama
  ]
}
