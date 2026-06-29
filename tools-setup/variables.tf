variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_B2als_v2"
    }
  }
}

variable "rg_name" {
  default = "Project-Robo"
}
variable "rg_location" {
  default = "Denmark East"
}