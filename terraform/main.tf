module "edonusum" {
  source = "./modules/edonusum"

  location    = var.location
  environment = var.environment
  project     = var.project
  node_count  = var.node_count
  vm_size     = var.vm_size
}