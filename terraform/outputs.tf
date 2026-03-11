
output "acr_login_server" {
  description = "URL del servidor de login del ACR"
  value = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  description = "ID del Azure Container Registry"
  value = azurerm_container_registry.acr.id
}

output "acr_admin_username" {
      description = "Usuario administrador del ACR"
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "Contraseña del usuario administrador del ACR"
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}



/* Network 

output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "subnet_prefix" {
  value = azurerm_subnet.subnet.address_prefixes
}

/* ACR  



output "acr_name" {
  description = "Nombre del ACR"
  value       = azurerm_container_registry.acr.name
}



output "docker_login_command" {
  description = "Comando para hacer login con Docker"
  value       = "docker login ${azurerm_container_registry.acr.login_server}"
}

output "integration_status" {
  description = "Estado de la integración AKS-ACR"
  value       = "AKS '${var.aks_name}' tiene permisos AcrPull sobre '${azurerm_container_registry.acr.name}'"
}

/*  AKS  

output "kubeconfig" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

*/