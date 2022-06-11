resource "azurerm_resource_group" "name" {
    location = var.location
    name = local.rgname
    
}