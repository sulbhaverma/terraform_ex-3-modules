variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure location for the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID."
  type        = string
}

variable "object_id" {
  description = "Object ID of the user or service principal to grant access to."
  type        = string
}

variable "secret_name" {
  description = "The name of the secret to store."
  type        = string
}

variable "secret_value" {
  description = "The value of the secret to store."
  type        = string
  sensitive   = true
}
