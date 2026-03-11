#Definimos los datos

#Definimos el nombre del grupo de recursos
variable "resource_group_name" {
  description = "Nombre del Resource Group existente en Azure donde se desplegarán los recursos."
  type = string
  default = "rg-cloud-lab"
}

variable "location" {
  description = "Ubicación especifica para los recursos"
  type    = string
  default = "eastus"
}

#Definimos la variable para el ACR 
variable "acr_name" {
  description = "Nombre del Azure Container Registry (debe ser único globalmente, solo letras y números)"
  type        = string
  default = "acre09jen"

  validation {
    condition     = can(regex("^[a-z0-9]{5,50}$", var.acr_name))
    error_message = "El nombre del ACR debe tener entre 5 y 50 caracteres, solo letras minúsculas y números."
  }
}

variable "acr_sku" {
  description = "SKU del ACR (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.acr_sku)
    error_message = "El SKU debe ser Basic, Standard o Premium."
  }
}

variable "acr_admin_enabled" {
  description = "Habilitar usuario administrador del ACR"
  type        = bool
  default     = true
}


/*



variable "vnet_e09" {
  description = "Nombre de la Virtual Network a crear."
  type        = string
  default     = "vnet-e09"
}

variable "vnet_e9_address_space" {
  description = "Espacio de direcciones CIDR para la VNet."
  type        = list(string)
  default     = ["10.59.0.0/16"]
}

variable "subnet_e09" {
  description = "Nombre de la Subnet principal."
  type        = string
  default     = "snet-e09"
}

variable "subnet_e9_prefix" {
  description = "Prefijo CIDR de la Subnet."
  type        = string
  default     = "10.59.1.0/24"
}

variable "aks_name" {
  description = "Nombre del cluster AKS"
  type        = string
  default     = "aks-e09"
}

variable "tags" {
  description = "Tags comunes para los recursos."
  type        = map(string)
  default = {
    owner      = "Jen"
    managed-by = "terraform"
    env        = "lab"
  }
}







variable "aks_name" {
  description = "Nombre del cluster AKS existente (para integración)"
  type        = string
}
*/