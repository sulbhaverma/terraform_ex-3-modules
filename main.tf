module "rsg" {
  source              = "./modules/rsg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  resource_group_name = module.rsg.name
  location            = var.location
}

module "subnet" {
  source              = "./modules/subnet"
  name                = var.subnet_name
  address_prefix      = var.subnet_address_prefix
  virtual_network_name = module.vnet.name
  resource_group_name  = module.rsg.name
}

module "nsg" {
  source              = "./modules/nsg"
  name                = var.nsg_name
  resource_group_name = module.rsg.name
  location            = var.location
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = module.rsg.name
  location            = var.location
  subnet_id           = module.subnet.id
  nsg_id              = module.nsg.id
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "azure_key_vault" {
  source              = "./modules/azure_key_vault"
  name                = var.kv_name
  location            = var.location
  resource_group_name = module.rsg.name
  tenant_id           = var.tenant_id
  secret_name         = "adminPassword"
  secret_value        = var.admin_password
}
