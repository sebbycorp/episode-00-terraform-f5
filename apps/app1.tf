#
resource "bigip_ltm_monitor" "terraform-monitor" {
  name        = "/Common/terraform-monitor"
  parent      = "/Common/http"
  send        = "GET /some/path\r\n"
  timeout     = "999"
  interval    = "999"
}

resource "bigip_ltm_node" "node-nginx-server-01" {
  name             = "/Common/nginx-server-01"
  address          = "10.20.0.5"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}

