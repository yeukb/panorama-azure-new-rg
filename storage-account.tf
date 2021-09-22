# Creating Storage Account for Boot Diagnostics for Serial Console access to VMs
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "panoramadiag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

  depends_on = [random_id.randomId]

  tags = {
    StoreStatus     = "DND"
    application     = "Panorama"
  }
}
