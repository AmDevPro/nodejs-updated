variable "client_id" {
  description = "The Azure Client ID for the Service Principal (App Registration)"
  type        = string
}

variable "client_secret" {
  description = "The Azure Client Secret for the Service Principal (App Registration)"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The Azure Subscription ID where resources will be deployed"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID for your Active Directory"
  type        = string
}