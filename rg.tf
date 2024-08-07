resource "azurerm_resource_group" "rg" {
  name = local.rg_name
  location = var.resoure_group_location
  tags = local.common_tags
}