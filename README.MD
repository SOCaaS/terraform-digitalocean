# Terraform DigitalOcean
This is for automated server request on DigitalOcean

# How to request a server
Add on main.tf
Example,
```terraform
servers = [
    {
        name = "server-1",
        type = "s-1vcpu-1gb"
    }
]
```

# Server Types
- s-1vcpu-1gb
- s-1vcpu-2gb
- s-2vcpu-2gb
- s-2vcpu-4gb
- s-4vcpu-8gb
- s-8vcpu-16gb

# Check for this in the Jenkins output file
```
Outputs:

ips = [
  "159.65.9.102",
]
```