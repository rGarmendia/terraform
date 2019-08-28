resource "azurerm_resource_group" "resource_gp" {
    name     = "Ricardo-Demo"
    location = "eastus"

    tags = {
        Owner = "Ricardo Garmendia"
    } 
}