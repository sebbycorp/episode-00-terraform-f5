resource "bigip_do" "do-f5" {
  do_json     = file("infrastructure/do.json")
  timeout = 15
}

# Loading from a file is the preferred method
#resource "bigip_ltm_irule" "rule" {
#  name  = "/Common/redirect.irule"
#  irule = file("irules/redirect.tcl")
#}

#Application Modules
module "apps" {
  source = "./apps"

}
