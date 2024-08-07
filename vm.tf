resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = local.vm_name
  computer_name       = local.vm_name 
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_DS1_v2"
  admin_username      = "azureuser"
  network_interface_ids = [ azurerm_network_interface.vmnic.id ]
  admin_password = "Password1234!"

  os_disk {
    name = "osdisk${random_string.random.id}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
  tags = local.common_tags

}