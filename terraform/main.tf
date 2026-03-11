#Dibujamos los recursos

#Traemos información del grupo de recursos ya existente en Azure
#se usa data cuando el recurso existe
#se usa resource cuando se esta creando el GR

data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

#Creación del ACR usando los datos del grupo
resource "azurerm_container_registry" "acr" {
  name = var.acr_name
  resource_group_name = data.azurerm_resource_group.existing.name
  location = var.location
  sku = var.acr_sku
  admin_enabled = var.acr_admin_enabled

  tags = {
    Enviroment = "Test"
    Project = "Project-Cloud"
  }
}



/* Network

#Grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#Crear la VNet en el RG existente
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_e09
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  address_space = var.vnet_e9_address_space
  dns_servers   = [] # deja vacío si usarás DNS por defecto

  tags = var.tags
}

#Crear una Subnet dentro de la VNet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_e09
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_e9_prefix]
}



/*  ACR 

# Obtener el Resource Group existente
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# Obtener el AKS existente
data "azurerm_kubernetes_cluster" "existing" {
  name                = var.aks_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

# ========================================
# CREAR ACR (Azure Container Registry)
# ========================================

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled

  # Configuración de red pública
  public_network_access_enabled = true

  # Deshabilitar características premium (no necesarias para Basic)
  anonymous_pull_enabled = false

  tags = var.tags
}

# ========================================
# INTEGRAR AKS con ACR
# ========================================

# Dar permisos a AKS para que pueda descargar imágenes del ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = data.azurerm_kubernetes_cluster.existing.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

# Asignación adicional para el identity del AKS (si usa managed identity)
resource "azurerm_role_assignment" "aks_acr_pull_identity" {
  count                            = data.azurerm_kubernetes_cluster.existing.identity[0].type == "SystemAssigned" ? 1 : 0
  principal_id                     = data.azurerm_kubernetes_cluster.existing.identity[0].principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
*/