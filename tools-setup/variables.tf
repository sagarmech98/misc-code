variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_B2als_v2"
    }
  }
}

variable "rg_name" {
  default = "Project"
}
variable "rg_location" {
  default = "ukwest"
}