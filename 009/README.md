# Nginx ingress controller kubernetes

### Plan for video
1. Create EKS cluster
2. Initialize Helm 3
3. Install NGINX ingress controller
4. Deploy our simple golang application

### Create EKS cluster
```bash
$ eksctl create cluster -f 009/eksctl-cluster.yaml
```

### Initialize Helm 3 on your Kubernetes cluster (add a chart repository)
```bash
$ helm repo add stable https://kubernetes-charts.storage.googleapis.com/
```

### Install NGINX ingress
```bash
$ helm repo update
$ helm install stable/mysql --generate-name
```