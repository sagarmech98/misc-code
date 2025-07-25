resource "azurerm_public_ip" "publicip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name  
    subnet_id                     = "/subscriptions/72129bc2-1be7-4c6e-971e-9375ebd6c232/resourceGroups/Project/providers/Microsoft.Network/virtualNetworks/Project-VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/72129bc2-1be7-4c6e-971e-9375ebd6c232/resourceGroups/Project/providers/Microsoft.Network/networkSecurityGroups/allow-all"
}


resource "azurerm_virtual_machine" "vm" {
  name                          = var.name
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  network_interface_ids         = [azurerm_network_interface.privateip.id]
  vm_size                       = var.vm_size
  delete_os_disk_on_termination = true

  storage_image_reference {

    id = "/subscriptions/72129bc2-1be7-4c6e-971e-9375ebd6c232/resourceGroups/Project/providers/Microsoft.Compute/images/devops-practice-image"
  }

  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.name
    admin_username = "testing"
    admin_password = "Password@1234"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "public_dns_record" {
  name                = var.name
  zone_name           = "vidyapractice.shop"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_public_ip.publicip.ip_address]
}


resource "azurerm_dns_a_record" "private_dns_record" {
  name                = "${var.name}-int"
  zone_name           = "vidyapractice.shop"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.privateip.private_ip_address]
}