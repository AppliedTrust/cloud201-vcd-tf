resource "vcd_vapp" "web" {
  name = "web"

  metadata = {
    Department = "Marketing"
  }
}

resource "vcd_vapp_org_network" "direct-network" {
  vapp_name         = vcd_vapp.web.name
  org_network_name  = data.vcd_network_direct.net.name
}

resource "vcd_vapp_vm" "web" {
  count         = 1
  vapp_name     = vcd_vapp.web.name
  name          = "web-${count.index}"
  catalog_name  = data.vcd_catalog_item.ubuntu.catalog
  template_name = data.vcd_catalog_item.ubuntu.name
  memory        = 2048
  cpus          = 2

  metadata = {
    role    = "web"
    env     = "staging"
    Department = "Marketing"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.direct-network.org_network_name
    ip_allocation_mode = "MANUAL"
    is_primary         = true
    ip                 = "10.100.0.1${count.index}"
  }

  customization {
    force                      = false
    change_sid                 = true
    allow_local_admin_password = true
    auto_generate_password     = true
  }

}
