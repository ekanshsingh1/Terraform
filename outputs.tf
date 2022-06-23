output "myout" {
  value = "Hello"
}

output "myout2" {
  value = azurerm_resource_group.name.id
}