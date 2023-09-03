variable "virtual_network" {
    type = string
    description = "This is the name of the virtual network"
  
}

variable "location" {
    type = string
    description = "This is the  location of the vm"
  
}

variable "address_space" {
    type = list(string)
    description = "This is the address of the network"
  
}

variable "resource_group_name" {
    type = string
    description = "This is the resourvce group name "
  
}

variable "subnet_name" {
    type = string
    description = "This is the subnet name of the virtual network"
  
}

variable "address_prefix" {
    type = list(string)
    description = "subnet ip addressing"

  
}

variable "ode_pub" {
    type = string
    description = "This is the public ip name of the virtual machine"
  
}


variable "ip_name" {
    type = string
    description = "this is for the creation of the vm ip name"
  
}




variable "vm_map" {
    type = map(object({
        name = string 

    }))
    default = {
      "vm1" = {
        name = "vm1"

      }
      "vm2" = {
        name = "vm2"

      }
      "vm3" = {
        name = "vm3"

      }
      "vm4" = {
        name = "vm4"

      }

    }
    description = "this is for the creation of multiple vm attribute "
  
}

variable "admin_username" {
    type = string
    description = "this is for the creation of the admin name"
  
}


