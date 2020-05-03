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
  name = "NVEWO001-DEN11-Dir-611-01"
}

