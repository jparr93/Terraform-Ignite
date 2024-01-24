module "hub" {
  source = "git::https://github.com/ans-coe/terraform-modules.git//azure/hub/?ref=2820e408f5c5db1b74818d84f363b6e1863dc0bb"

  location = "UKSouth"
  tags     = local.tags

  resource_group_name  = "rg-hub-test"
  virtual_network_name = "S-uks-hub-vnet"

  address_space = ["10.2.0.0/22"]

  bastion_config = {
    name                        = "S-uks-prd-bastion-01"
    subnet_prefix               = "10.2.0.0/26"
    network_security_group_name = "S-uks-prd-bastion-nseg"
  }
}
