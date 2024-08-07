# Input Variables
variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "hr"
}
variable "environment" {
  description = "Environment Name"
  type = string
  default = "dev"
}
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "myrg"
}
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "eastus"
}
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "myvnet"
}
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string 
}
variable "publicip_name" {
  description = "Public IP Name"
  type = string 
}
variable "network_interface_name" {
  description = "Network Interface Name"
  type = string 
}

variable "virtual_machine_name" {
  description = "Virtual Machine Name"
  type = string 
}








