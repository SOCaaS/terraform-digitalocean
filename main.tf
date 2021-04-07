terraform {
  backend "local" {
    path = "/root/tfstate/digital-ocean-servers.tfstate"
  }
}

module "digitalocean" {
    source              = "./droplet"
    servers             = [
            {
             name = "digitalocean",
             type = "s-2vcpu-4gb"
            },
           {
            name = "server-1",
            type = "s-2vcpu-4gb"
           }
            ,
           {
            name = "server-2",
            type = "s-2vcpu-4gb"
           }
#          ,
#       {
#           name = "server-4",
#           type = "s-2vcpu-4gb"
#       }
    ]
    digital_ocean_key   = var.digital_ocean_key
}
