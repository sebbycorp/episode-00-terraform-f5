#
resource "bigip_ltm_monitor" "terraform-monitor" {
  name        = "/Common/terraform-monitor"
  parent      = "/Common/http"
  send        = "GET /some/path\r\n"
  timeout     = "999"
  interval    = "999"
}

resource "bigip_ltm_node" "node-nginx-server1" {
  name             = "/Common/nginx-server1"
  address          = "10.20.0.5"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}

resource "bigip_ltm_node" "node-nginx-server3" {
  name             = "/Common/nginx-server3"
  address          = "10.20.0.3"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}

resource "bigip_ltm_node" "node-nginx-server4" {
  name             = "/Common/nginx-server4"
  address          = "10.20.0.4"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}


resource "bigip_ltm_pool" "pool" {
  name                = "/Common/nginx-pool"
  load_balancing_mode = "round-robin"
  description         = "Test-Pool"
  monitors            = ["/Common/terraform-monitor"]
  allow_snat          = "yes"
  allow_nat           = "yes"
}

resource "bigip_ltm_pool_attachment" "node-pool-attach" {
  pool = "/Common/terraform-pool"
  node = "/Common/node-nginx-server1:80"
}

resource "bigip_ltm_virtual_server" "http" {
  name = "/Common/terraform_vs_http"
  destination = "10.20.0.12"
  port = 80
  pool = "/Common/nginx-pool"
}
