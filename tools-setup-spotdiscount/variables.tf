variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_D2ls_v5"
    }
  }
}

variable "rg_name" {
  default = "Project-Robo"
}
variable "rg_location" {
  default = "Denmark East"
}