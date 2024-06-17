variable "keyVault_Name" {
  description = "Name of the key vault you are retrieving a secret from"
  default = "test"
  type = string
}

variable "secret_Name" {
  description = "Name of the secret"
  default = "test"
  type = string
}