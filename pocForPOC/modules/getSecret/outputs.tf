output "secret_value" {
  description = "Key Value"
  value = "${data.azurerm_key_vault_secret.value}"
}