# Instructions to create VPC

- Create VPC

```bash
aws ec2 create-vpc \
  --cidr-block 10.0.0.0/16 \
  --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=main}]'
```

- Create public subnet

```bash
aws ec2 create-subnet \
--vpc-id <your-vpc-id> \
--availability-zone us-east-1a \
--cidr-block 10.0.0.0/24 \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public}]'
```

- Create private subnet

```bash
aws ec2 create-subnet \
--vpc-id <your-vpc-id> \
--availability-zone us-east-1b \
--cidr-block 10.0.1.0/24 \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private}]'
```

- Allocate IP for NAT Gateway

```bash
aws ec2 allocate-address
```

- Create NAT Gateway

```bash
aws ec2 create-nat-gateway --subnet-id subnet-0d52e9c70c00fb323 --allocation-id eipalloc-0295d8a2d16314166 --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=my-nat-gateway}]'
```

- Create internet gateway

```bash
aws ec2 create-internet-gateway
```

- Cretae public route table

```bash
aws ec2 create-route-table --vpc-id vpc-0724881ef1256d0ee --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=public-route}]'
```

- Attach internet gateway

```bash
aws ec2 attach-internet-gateway --internet-gateway-id igw-0dc1279bda8b73b8c --vpc-id vpc-0724881ef1256d0ee
```

- Create default route to Internet

```bash
aws ec2 create-route --route-table-id rtb-09a5fa97e377af9dc --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0dc1279bda8b73b8c
```

- Cretae private route table

```bash
aws ec2 create-route-table --vpc-id vpc-0724881ef1256d0ee --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=private-route}]'
```

- Create default route to NAT gateway

```bash
aws ec2 create-route --route-table-id rtb-01b088a6c59b3bc45 --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-010274477794c2db2
```

- Change routing table for public subnet

```bash
aws ec2 associate-route-table --route-table-id rtb-09a5fa97e377af9dc --subnet-id subnet-0d52e9c70c00fb323
```

- - Change routing table for private subnet

```bash
aws ec2 associate-route-table --route-table-id rtb-09a5fa97e377af9dc --subnet-id subnet-0d52e9c70c00fb323
```

- Updaye public subnet to assign public IPs

```bash
aws ec2 modify-subnet-attribute --subnet-id subnet-0d52e9c70c00fb323 --map-public-ip-on-launch
```
