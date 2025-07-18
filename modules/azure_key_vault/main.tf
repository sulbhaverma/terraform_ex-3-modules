resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"

  purge_protection_enabled    = false
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id  # e.g. service principal or user object ID

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete"
    ]
  }
}

resource "azurerm_key_vault_secret" "this" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.this.id
}
