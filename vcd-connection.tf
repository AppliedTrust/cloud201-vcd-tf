provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_pass
  org                  = var.vcd_org
  vdc                  = var.vcd_vdc
  url                  = var.vcd_url
  max_retry_timeout    = 90
  allow_unverified_ssl = false
}

data "vcd_network_direct" "net" {
  org  = var.vcd_org
  vdc  = var.vcd_vdc
  name = var.vcd_network
}

data "vcd_catalog_item" "ubuntu" {
  org     = var.vcd_org
  catalog = var.vcd_catalog
  name    = "ubuntu-20.04-lts"
}