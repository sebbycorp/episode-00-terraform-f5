#The following application builds

resource "bigip_ltm_monitor" "website-monitor" {
  name        = "/Common/website-monitor"
  parent      = "/Common/http"
  send        = "GET /some/path\r\n"
  timeout     = "999"
  interval    = "999"
}

resource "bigip_ltm_node" "node_nginx-server-02" {
  name             = "/Common/nginx-server-02"
  address          = "10.20.0.6"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}