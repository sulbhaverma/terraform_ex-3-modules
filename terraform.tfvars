resource_group_name   = "my-dev-rg"
location              = "East US"

vnet_name             = "my-vnet"
vnet_address_space    = ["10.0.0.0/16"]

subnet_name           = "my-subnet"
subnet_address_prefix = "10.0.1.0/24"

nsg_name              = "my-nsg"

vm_name               = "my-vm"
admin_username        = "azureuser"
admin_password        = "SuperSecret123!" # For demo only

kv_name               = "mykv12345" # Must be globally unique
tenant_id             = "your-tenant-id"
object_id             = "object-id-of-user-or-sp"
