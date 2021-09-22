# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    StoreStatus     = "DND"
    application     = "Panorama"
  }
}
