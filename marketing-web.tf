resource "vcd_vapp" "web" {
  name = "web"

  metadata = {
    Department = "Marketing"
  }
}

resource "vcd_vapp_org_network" "direct-network" {
  vapp_name         = vcd_vapp.web.name
  org_network_name  = vcd_network_direct.net.name
}