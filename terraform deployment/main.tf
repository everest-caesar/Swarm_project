terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "everest-rg" {
    name = "ev-RG"
    location = "West Europe"
}

module "VIRTUALMACHINE1" {
    source = "./virtual-vm"
    virtual_network = "everest-vn"
    location = "West Europe"
    address_space = ["10.0.0.0/8"]
    address_prefix = ["10.1.0.0/16"]
    resource_group_name = "ev-RG"
    subnet_name = "Ode_subnet_name"
    ode_pub = "Ode_publicIp"
    ip_name = "ode_privateIp"
    admin_username = "adminuser"

}


    








    

