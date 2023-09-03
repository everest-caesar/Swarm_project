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
  subscription_id = "2fe555da-4c66-4a14-a4fa-9acb4a54ac8d"
  client_id       = "6ce5a600-0e98-4160-a9ed-5372045df309"
  client_secret   = "Fik8Q~FPLcvGrgBi08RBw3f~yJckEw6YvRoy4bVY"
  tenant_id       = "34f9e983-4c31-4a80-928c-e7cc4f49d625"
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


    








    

