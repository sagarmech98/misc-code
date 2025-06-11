module "tools-vm" {
  for_each    = var.tools
  source      = "./vm"
  rg_name     = var.rg_name
  rg_location = var.rg_location
  name = each.key
  vm_size = each.value["vm_size"]
}