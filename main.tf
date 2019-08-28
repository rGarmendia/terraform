 module "linuxservers" {
    source              = "Azure/compute/azurerm"
    location            = "West US 2"
    vm_os_simple        = "UbuntuServer"
    public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
    vnet_subnet_id      = "${module.network.vnet_subnets[0]}"
  }

  module "windowsservers" {
    source              = "Azure/compute/azurerm"
    location            = "West US 2"
    vm_hostname         = "mywinvm" // line can be removed if only one VM module per resource group
    admin_password      = "ComplxP@ssw0rd!"
    vm_os_simple        = "WindowsServer"
    is_windows_image    = "true"
    public_ip_dns       = ["winsimplevmips"] // change to a unique name per datacenter region
    vnet_subnet_id      = "${module.network.vnet_subnets[0]}"
  }

  module "network" {
    source              = "Azure/network/azurerm"
    version             = "~> 1.1.1"
    location            = "West US 2"
    allow_rdp_traffic   = "true"
    allow_ssh_traffic   = "true"
    resource_group_name = "terraform-compute"
  }

  output "linux_vm_public_name"{
    value = "${module.linuxservers.public_ip_dns_name}"
  }

  output "windows_vm_public_name"{
    value = "${module.windowsservers.public_ip_dns_name}"
  }




# module "mymodule" {
#   source = "./mymodule"
  
# }




# # variable "prefix" {
# #   default = "rg"
# # }

# # resource "azurerm_virtual_network" "main" {
# #   name                = "${var.prefix}-network"
# #   address_space       = ["10.0.0.0/16"]
# #   location            = "${azurerm_resource_group.resource_gp.location}"
# #   resource_group_name = "${azurerm_resource_group.resource_gp.name}"
# # }

# # resource "azurerm_subnet" "internal" {
# #   name                 = "internal"
# #   resource_group_name  = "${azurerm_resource_group.resource_gp.name}"
# #   virtual_network_name = "${azurerm_virtual_network.main.name}"
# #   address_prefix       = "10.0.2.0/24"
# # }

# # resource "azurerm_network_interface" "main" {
# #   name                = "${var.prefix}-nic"
# #   location            = "${azurerm_resource_group.resource_gp.location}"
# #   resource_group_name = "${azurerm_resource_group.resource_gp.name}"

# #   ip_configuration {
# #     name                          = "testconfiguration1"
# #     subnet_id                     = "${azurerm_subnet.internal.id}"
# #     private_ip_address_allocation = "Dynamic"
# #   }
# # }

# # resource "azurerm_virtual_machine" "main" {
# #   name                  = "${var.prefix}-vm"
# #   location              = "${azurerm_resource_group.resource_gp.location}"
# #   resource_group_name   = "${azurerm_resource_group.resource_gp.name}"
# #   network_interface_ids = ["${azurerm_network_interface.main.id}"]
# #   vm_size               = "Standard_DS1_v2"

# #   # Uncomment this line to delete the OS disk automatically when deleting the VM
# #   delete_os_disk_on_termination = true


# #   # Uncomment this line to delete the data disks automatically when deleting the VM
# #   delete_data_disks_on_termination = true

# #   storage_image_reference {
# #     publisher = "Canonical"
# #     offer     = "UbuntuServer"
# #     sku       = "16.04-LTS"
# #     version   = "latest"
# #   }
# #   storage_os_disk {
# #     name              = "myosdisk1"
# #     caching           = "ReadWrite"
# #     create_option     = "FromImage"
# #     managed_disk_type = "Standard_LRS"
# #   }
# #   os_profile {
# #     computer_name  = "hostname"
# #     admin_username = "testadmin"
# #     admin_password = "Password1234!"
# #   }
# #   os_profile_linux_config {
# #     disable_password_authentication = false
# #   }
# #   tags = {
# #     Owner = "Ricardo Garmendia"
# #   }
# # }