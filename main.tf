resource "bigip_do"  "do-f5" {
     do_json = "${files("do.json")}"
     config_name = "deploy-do-f5"
 }

 resource "bigip_as3"  "as3-app1" {
     as3_json = "${files("app1.json")}"
     config_name = "config-app1"
 }