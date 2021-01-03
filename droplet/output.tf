output "ips" {
    value = digitalocean_droplet.server[*].ipv4_address
}