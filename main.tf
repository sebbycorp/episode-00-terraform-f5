resource "bigip_do"  "do-f5" {
     do_json = "${file("/files/do.json")}"
     config_name = "deploy-do-f5"
 }

 resource "bigip_as3"  "as3-app1" {
     as3_json = "${file("/files/app1.json")}"
     config_name = "config-app1"
 }
 
 resource "bigip_ltm_node" "node" {
  name             = "/Common/terraform_node1"
  address          = "172.16.3.103"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}