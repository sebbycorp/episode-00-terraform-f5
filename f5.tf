variable "username" {}
variable "password" {}

provider "bigip" {
  version  = "~> 1.1"
  address  = "192.168.1.126"
  username = var.username
  password = var.password
}

