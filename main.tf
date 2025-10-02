resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name}-${var.env}"
  location = var.location
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.address_space]
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.name}-${var.env}-default"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = [var.address_prefixes]
}

data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.acr_rg
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                 = "aks-${var.name}-${var.env}"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  dns_prefix           = "aks-${var.name}-${var.env}"
  azure_policy_enabled = true

  default_node_pool {
    name                 = "default"
    vm_size              = var.pool_size
    node_count           = 1
    vnet_subnet_id       = azurerm_subnet.subnet.id
    auto_scaling_enabled = false
  }

  lifecycle {
    ignore_changes = [microsoft_defender, default_node_pool, monitor_metrics]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    env        = var.env
    department = var.department
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    pod_cidr            = var.pod_cidr
    network_policy      = "azure"
  }

  web_app_routing {
    dns_zone_ids = []
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "worker" {
  name                  = "worker"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.pool_size
  auto_scaling_enabled  = var.auto_scaling_enabled
  min_count             = var.min_count
  max_count             = var.max_count
  vnet_subnet_id        = azurerm_subnet.subnet.id
}

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "log-${var.name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    env        = var.env
    department = var.department
  }
}

resource "azurerm_monitor_workspace" "aks" {
  name                = "metric-${var.name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    env        = var.env
    department = var.department
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.name}-${var.env}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    env        = var.env
    department = var.department
  }
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
