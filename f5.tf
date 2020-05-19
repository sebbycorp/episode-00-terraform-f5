variable "username" {}
variable "password" {}

provider "bigip" {
  address  = "192.168.86.61"
  username = var.username
  password = var.password
}

