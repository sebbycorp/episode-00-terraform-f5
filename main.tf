resource "bigip_do"  "do-example" {
     do_json = "${file("example.json")}"
     config_name = "sample_test1"
 }