module "webapp" {
  source = "git::https://github.com/ans-coe/terraform-modules.git//azure//app-service//webapp"

  name                = "${local.resource_prefix}-wa"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  tags                = local.tags
  os_type = "Windows"
  plan = {
    # Required as Basic/Windows only supports single-slot.
    sku_name = "S1"
  }

  slots = ["preview"]
}

