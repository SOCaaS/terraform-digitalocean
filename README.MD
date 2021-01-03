# Terraform DigitalOcean
This is for automated server request on DigitalOcean

## How to request a server
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

## Server Types
- s-1vcpu-1gb
- s-1vcpu-2gb
- s-2vcpu-2gb
- s-2vcpu-4gb
- s-4vcpu-8gb
- s-8vcpu-16gb

## Check for this in the Jenkins output file
https://jenkins-uow.1ez.xyz/job/SOCaaS/job/terraform-digitalocean/job/master
```
Outputs:

ips = [
  "159.65.9.102",
]
```

## What to do to destroy the server?
Comment or delete the json, as follow,
```
    # {
    #     name = "server-1",
    #     type = "s-1vcpu-1gb"
    # }
```

## Deploy multiple server at once
```
    {
      name = "server-1",
      type = "s-1vcpu-1gb"
    },
    {
      name = "server-2",
      type = "s-1vcpu-1gb"
    }
```