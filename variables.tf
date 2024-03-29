provider "azurerm" {
    subscription_id  = "${var.subscription_id}"
    client_id        = "${var.client_id}"
    client_secret    = "${var.client_secret}"
    tenant_id        = "${var.tenant_id}"  
}

variable "subscription_id" {
    description = "Enter Suscription ID for provisioning resources in Azure"
}

variable "client_id" {
    description = "Enter Client ID for Application created in Azure"
}

variable "client_secret" {
    description = "Enter Client secret for Application created in Azure"
}

variable "tenant_id" {
    description = "Enter Tenant ID / Directory ID of your Azure AD."
}