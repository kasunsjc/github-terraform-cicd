output "resource_group_id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.rg.id 
}
output "resource_group_name" {
  description = "Resource Group name"
  value = azurerm_resource_group.rg.name  
}

output "virtual_network_name" {
  description = "Virutal Network Name"
  value = azurerm_virtual_network.vnet.name 
}

output "vm_public_ip_address" {
  description = "My Virtual Machine Public IP"
  value = azurerm_linux_virtual_machine.linuxvm.public_ip_address
}

output "vm_admin_user" {
  description = "My Virtual Machine Admin User"
  value = azurerm_linux_virtual_machine.linuxvm.admin_username
}



