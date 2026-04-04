locals {
  kubernetes_cluster_name = "aks-${var.project}-${var.environment}"
  resource_group_name     = "rg-${var.project}-${var.environment}"
  mssql_server_name      = "sql-${var.project}-${var.environment}"
  mssql_database_name    = "sqldb-${var.project}-${var.environment}"
  key_vault_name        = "kv-${var.project}-${var.environment}"
  dns_prefix            = "${var.project}${var.environment}"
}

resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "main" {

  name                      = local.kubernetes_cluster_name
  location                  = var.location
  resource_group_name       = local.resource_group_name
  dns_prefix                = local.dns_prefix
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.vm_size

    # sonradan eklendi
    upgrade_settings {
      max_surge                     = "10%"
      drain_timeout_in_minutes      = 0
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }

  # sonradan eklendi
  key_vault_secrets_provider {
    secret_rotation_enabled  = false
    secret_rotation_interval = "2m"
  }
}

resource "azurerm_mssql_server" "main" {
  name                         = local.mssql_server_name
  resource_group_name          = local.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = azurerm_key_vault_secret.main.value

}

resource "azurerm_mssql_database" "main" {
  name                 = local.mssql_database_name
  server_id            = azurerm_mssql_server.main.id
  sku_name             = "Basic"
  storage_account_type = "Local"
}

resource "azurerm_mssql_firewall_rule" "main" {
  name             = "allow-azure"
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                = local.key_vault_name
  location            = var.location
  resource_group_name = local.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_key_vault_secret" "main" {
  name         = "sqladmin"
  value        = random_password.main.result
  key_vault_id = azurerm_key_vault.main.id
}

resource "random_password" "main" {
  length = 16
}
