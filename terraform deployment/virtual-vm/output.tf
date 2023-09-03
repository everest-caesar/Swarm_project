output "public_ip_output" {
  value = {
    for vm_name, vm_data in var.vm_map :
    vm_name => azurerm_public_ip.ode_publicIp[vm_data.name].ip_address
  }
}

