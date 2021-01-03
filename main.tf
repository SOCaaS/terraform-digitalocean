terraform {
  backend "local" {
    path = "/root/tfstate/digital-ocean-servers.tfstate"
  }
}

module "digitalocean" {
    source              = "./droplet"
    servers             = []
    digital_ocean_key   = var.digital_ocean_key
}
