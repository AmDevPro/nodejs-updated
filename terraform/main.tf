provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "nodejs-azure-rg"
  location = "West Us" # Adjust the region if needed
}

resource "azurerm_service_plan" "serviceplan" {
  name                = "nodejs-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B1"       # Use Basic Tier if Free Tier (F1) quota is unavailable
  os_type  = "Linux"    # Specify Linux OS
}

resource "azurerm_linux_web_app" "appservice" {
  name                = "nodejs-azure-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.serviceplan.id # Correct argument

  site_config {
    always_on = false
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "14.x" # Specify Node.js version
  }
}