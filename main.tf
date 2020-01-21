resource "bigip_do" "do-f5" {
  do_json     = "${file("files/do.json")}"
  config_name = "deploy-do-f5"
}

resource "bigip_as3" "as3-app1" {
  as3_json    = "${file("files/app1.json")}"
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
resource "bigip_ltm_monitor" "monitor" {
  name        = "/Common/terraform_monitor"
  parent      = "/Common/http"
  send        = "GET /some/path\r\n"
  timeout     = "999"
  interval    = "999"
}

resource "bigip_ltm_pool" "pool" {
  name                = "/Common/terraform-pool"
  load_balancing_mode = "round-robin"
  description         = "Test-Pool"
  allow_snat          = "yes"
  allow_nat           = "yes"
}

resource "bigip_ltm_virtual_server" "http" {
  name = "/Common/terraform_vs_http"
  destination = "10.12.12.12"
  port = 80
  pool = "/Common/terraform-pool"
}

output "f5_node" {
  value = bigip_ltm_node.node.address
}