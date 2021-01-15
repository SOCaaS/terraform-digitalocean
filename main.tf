terraform {
  backend "local" {
    path = "/root/tfstate/digital-ocean-servers.tfstate"
  }
}

module "digitalocean" {
    source              = "./droplet"
    servers             = [
        {
            name = "server-1",
            type = "s-1vcpu-1gb"
        }
        ,{
            name = "server-2",
            type = "s-1vcpu-1gb"
        }
    ]
    digital_ocean_key   = var.digital_ocean_key
}
