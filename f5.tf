variable "username" {}
variable "password" {}

provider "bigip" {
  address  = "192.168.90.5"
  username = var.username
  password = var.password
}

