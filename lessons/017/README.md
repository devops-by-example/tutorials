# GCP VPC Tutorial | How to create Public and Private Subnet in GCP

### Create GCP VPC
```bash
$ gcloud compute networks create main --bgp-routing-mode=regional --subnet-mode=custom
```

### Create Public Sunbet
```bash
$ gcloud compute networks subnets create public --network=main --range=10.0.0.0/24 --region=us-west2
```

### Create Private Sunbet
```bash
$ gcloud compute networks subnets create private --network=main --range=10.0.1.0/24 --region=us-west2 --enable-private-ip-google-access
```

### Create Cloud Router
```bash
$ gcloud compute routers create router --network=main --region=us-west2
```

### Create NAT Gateway
```bash
$ gcloud compute routers nats create nat --router=router --region=us-west2 --nat-custom-subnet-ip-ranges=private --auto-allocate-nat-external-ips
```
