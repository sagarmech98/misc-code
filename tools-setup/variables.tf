variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_E2s_v3"
    }
  }
}

variable "rg_name" {
  default = "Project"
}
variable "rg_location" {
  default = "UK West"
}