variable "resource_group_name" {
  description = "RG Name"
}

variable "location" {
  description = "Location"
}

variable "virtualNetworkName" {
  description = "Virtual Network Name"
  default = "Panorama-VNET"
}

variable "subnetName" {
  description = "Subnet Name"
  default = "Panorama-Subnet"
}

variable "VNETaddressPrefix" {
  description = "VNET Address Prefix"
  default = "172.31.254.0/23"
}

variable "SubnetPrefix" {
  description = "Panorama Subnet Prefix"
  default = "172.31.254.0/24"
}

variable "virtualMachineName" {
  description = "Virtual Machine Name"
}

variable "virtualMachineSize" {
  description = "Virtual Machine Size"
}

variable "panoramaVersion" {
  description = "Panorama Version"
}

variable "adminUsername" {
  description = "Admin Username"
}

variable "adminPassword" {
  description = "Admin Password"
}

variable "DataDiskSizeInGB" {
  description = "Panorama Data Disk Size in GB"
  default = 2048
}

variable "add_data_disk" {
  description = "To add or not to add an extra disk to Panorama for logging"
}