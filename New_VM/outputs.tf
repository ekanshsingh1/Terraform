output "myout" {
  value = "Hello"
}

output "myout2" {
  value = azurerm_virtual_machine.main.id
}