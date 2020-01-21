resource "bigip_do" "do-f5" {
  do_json     = "${file("onboard-config/do.json")}"
  config_name = "deploy-do-f5"
}

resource "bigip_as3" "as3-app1" {
  as3_json    = "${file("as3apps/app1.json")}"
  config_name = "config-app1"
}


# Loading from a file is the preferred method
resource "bigip_ltm_irule" "rule" {
  name  = "/Common/redirect.irule"
  irule = "${file("irules/redirect.tcl")}"
}