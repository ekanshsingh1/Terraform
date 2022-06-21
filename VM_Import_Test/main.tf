# variable "prefix" {
#   default = "tfvmex"
# }

# resource "azurerm_resource_group" "example" {
#   name     = "${var.prefix}-resources"
#   location = "West Europe"
# }

# resource "azurerm_virtual_network" "main" {
#   name                = "${var.prefix}-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_subnet" "internal" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# resource "azurerm_network_interface" "main" {
#   name                = "${var.prefix}-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = azurerm_subnet.internal.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

resource "azurerm_virtual_machine" "main" {
  name                  = "Linux1" #"${var.prefix}-vm"
  location              = "East US 2"#azurerm_resource_group.example.location
  resource_group_name   = "func_app" #azurerm_resource_group.example.name
  network_interface_ids = ["/subscriptions/6df4d7c6-6c9a-4bd7-9fb7-1ed4c593b5b8/resourceGroups/func_app/providers/Microsoft.Network/networkInterfaces/linux1838"]
  vm_size               = "Standard_DC1s_v3"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  storage_os_disk {
    name              = "Linux1_OsDisk_1_8b8a01c093464e5a90567d2698e2ecaf"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "Linux1"
    admin_username = "azureuser"
    admin_password = "Password@1234" #"Password1234!"
    custom_data  = ""
  }
  os_profile_linux_config {
    disable_password_authentication = false
    # ssh_keys = ""
  }
#   tags = {
#     environment = "staging"
#   }
}