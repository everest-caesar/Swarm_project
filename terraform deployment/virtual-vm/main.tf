resource "azurerm_virtual_network" "ode-vn" {
    
    name = var.virtual_network
    location = var.location
    address_space = var.address_space
    resource_group_name = var.resource_group_name
  
}

resource "azurerm_subnet" "ode-subnet" {
    name = var.subnet_name
    resource_group_name = var.resource_group_name
    address_prefixes = var.address_prefix
    virtual_network_name = azurerm_virtual_network.ode-vn.name 
}

resource "azurerm_public_ip" "ode_publicIp" {
    for_each = var.vm_map
    name = "${each.value.name}-pub_Ip"
    allocation_method = "Dynamic"
    location = var.location
    resource_group_name = var.resource_group_name 
    

    tags = {
    environment = "Production"
  
  }
}

resource "azurerm_network_interface" "ode_nic" {
    for_each = var.vm_map
    name = "${each.value.name}-nic"
    location = var.location
    resource_group_name = var.resource_group_name 

    ip_configuration {
        name = var.ip_name
        subnet_id = azurerm_subnet.ode-subnet.id
        public_ip_address_id = azurerm_public_ip.ode_publicIp[each.value.name].id
        private_ip_address_allocation = "Dynamic"
      
    }
}

resource "azurerm_linux_virtual_machine" "everest-vm" { 
    for_each = var.vm_map
    name = each.value.name 
    location = var.location 
    resource_group_name = var.resource_group_name
    size = "Standard_F2"
    admin_username = var.admin_username
    network_interface_ids = [azurerm_network_interface.ode_nic[each.key].id]

  
    admin_ssh_key {
        username   = "adminuser"
        public_key = file("/Users/everestode/Desktop/terraform deployment/everest.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}



  


