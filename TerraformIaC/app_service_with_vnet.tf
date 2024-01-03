variable "resource_group_name" {}
variable "location" {}
variable "app_service_name" {}
variable "app_service_plan_name" {}
variable "subnet_id" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_app_service_plan" "plan" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
    name                = var.app_service_name
    location            = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.plan.id

    identity {
        type = "SystemAssigned"
    }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_app_service.app.id
  subnet_id      = var.subnet_id
}