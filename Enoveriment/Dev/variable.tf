variable "resource_group" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))

  }))
}

variable "stg" {
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    account_tier                     = string
    account_replication_type         = string
    account_kind                     = optional(string)
    cross_tenant_replication_enabled = optional(bool)
    access_tier                      = optional(string)
    edge_zone                        = optional(string)
    https_traffic_only_enabled       = optional(bool)
    min_tls_version                  = optional(string)
  }))

}

variable "container" {
  type = map(object({
    name                  = string
    storage_account_name  = string
    resource_group_name   = string
    container_access_type = optional(string)


  }))
}

variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = optional(list(object({
      name = string
      address_prefixes = list(string) })
    ))
  }))

}

variable "pip" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    allocation_method    = string
    ddos_protection_mode = optional(string)
    tags                 = optional(map(string))
  }))
}

variable "nic" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    auxiliary_sku        = optional(string)
    auxiliary_mode       = optional(string)
    tags                 = optional(map(string))
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "nsg" { type = map(object({
  name                 = string
  location             = string
  resource_group_name  = string
  nic_name             = string
  virtual_network_name = string
  subnet_name          = string

  security_rules = optional(map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })), {})
})) }

variable "keyvault" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    location                    = string
    purge_protection_enabled    = bool
    soft_delete_retention_days  = number
    sku_name                    = string
  }))
}

variable "secrets" {
  type = map(object({
    key_name            = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))
}

variable "servers" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    version                       = string
    public_network_access_enabled = bool
    administrator_login           = optional(string)
    administrator_login_password  = optional(string)
    minimum_tls_version           = optional(string)
    tags                          = optional(map(string))
    azuread_administrators = optional(list(object({
      login_username = string
      object_id      = string
    })))
  }))
}

variable "database" {
  type = map(object({
    server_name         = string
    resource_group_name = string
    name                = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    tags                = optional(map(string))

  }))
}

variable "vms" {
  type = map(object({
    vm_name             = string
    size                = string
    resource_group_name = string
    location            = string
    key_name            = string
    secret_name         = string
    secret_value        = string
    nic_name            = string
    os_disk = list(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

    script_name = optional(string)
  }))
}

