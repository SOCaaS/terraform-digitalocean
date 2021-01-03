data "digitalocean_ssh_key" "ssh_key_id" {
  name = var.public_key_name
}

resource "digitalocean_droplet" "server" {
  count             = length(var.server)
  image             = "ubuntu-20-04-x64"
  name              = var.server[count.index]["name"]
  region            = "sgp1"
  size              = var.server[count.index]["type"]
  ssh_keys          = [data.digitalocean_ssh_key.ssh_key_id.id] # ssh key id
  private_networking = true
}