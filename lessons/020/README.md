# Terraform Import Existing Resources AWS

### Initialize Terraform
```bash
$ terraform init
```

### Add VPC Resource and Run Terraform Plan
```bash
$ terraform plan
```

### Import AWS VPC using vpc id
```bash
$ terraform import aws_vpc.main vpc-06fabcc9aa4fe5f62
```

### Add Subnets to Terraform

### Import Subnets using ids
```bash
$ terraform import aws_subnet.public subnet-07d90be5b57a49d64
$ terraform import aws_subnet.private subnet-0cf9ced82ab20855b
```

### Add IGW to Terraform

### Import IGW using id
```bash
$ terraform import aws_internet_gateway.igw igw-08a92df624a55602b
```

### Add EIP to Terraform

### Import EIP using Public IP
```bash
$ terraform import aws_eip.nat_eip 3.232.182.134
```

### Add NAT Gateway to Terraform

### Import NAT Gateway using id
```bash
$ terraform import aws_nat_gateway.nat nat-0ec25ac1b56a1ad92
```

### Add Routes and Route Associating to Terraform

### Import to Terraform State
```bash
$ terraform import aws_route_table.public rtb-0503544c169dc7b8d
$ terraform import aws_route_table.private rtb-01853d6929a5cd87a
$ terraform import aws_route_table_association.public subnet-07d90be5b57a49d64/rtb-0503544c169dc7b8d
$ terraform import aws_route_table_association.private subnet-0cf9ced82ab20855b/rtb-01853d6929a5cd87a
```

### Add Security Group and EC2 to Terraform

### Import to Terraform State
```bash
$ terraform import aws_security_group.nginx sg-03393852b39a98c39
$ terraform import aws_instance.nginx i-002554c996cdb0cb5
```

### Add Route53 Hosted Zone and A Record to Terraform

### Import to Terraform State
```bash
$ terraform import aws_route53_zone.devops Z064099839IK3WWEJ62OF
$ terraform import aws_route53_record.nginx Z064099839IK3WWEJ62OF_api.devopsbyexample.io_A
```
