#
resource "bigip_ltm_monitor" "monitor" {
  name        = "/Common/terraform_monitor"
  parent      = "/Common/http"
  send        = "GET /some/path\r\n"
  timeout     = "999"
  interval    = "999"
}

resource "bigip_ltm_node" "node" {
  name             = "/Common/nginx_server"
  address          = "10.20.0.5"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}