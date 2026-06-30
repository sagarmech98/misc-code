variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_D2ls_v5"
    }
  }
}

variable "rg_name" {
  default = "Project"
}
variable "rg_location" {
  default = "Uk West"
}