variable "tools" {
  default = {
    vault = {
      vm_size = "B2s"
    }
  }
}

variable "rg_name" {
  default = "Project"
}
variable "rg_location" {
  default = "UK West"
}