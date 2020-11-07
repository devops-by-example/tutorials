# Nginx ingress controller kubernetes

### Plan for video
1. Create EKS cluster
2. Initialize Helm 3
3. Install NGINX ingress controller
4. Deploy our simple golang application
4. Destroy EKS cluster

### Create EKS cluster
```bash
$ cd 009
$ eksctl create cluster -f eksctl-cluster.yaml
```

### Initialize Helm 3 on your Kubernetes cluster (add a chart repository)
```bash
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
```

### Install NGINX ingress
```bash
$ helm repo update
$ helm install ingress-nginx/ingress-nginx --generate-name
```

### Build golang app
```bash
$ docker build -t app:v0.1.0 -f Dockerfile .
$ docker tag app:v0.1.0 <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/app:v0.1.0
$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.us-east-1.amazonaws.com
$ docker push <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/app:v0.1.0
```

### Deploy our app to kubernetes
```bash
$ kubectl apply -f deployment.yaml
$ kubectl apply -f service.yaml
$ kubectl get endpoints
$ kubectl apply -f ingress.yaml
```

### Create CNAME or A record based on your kubernetes provider
```bash
api CNAME ab367a7323d7548b6803200859d023b8-1085326791.us-east-1.elb.amazonaws.com
$ nslookup api.<your-domain>
$ curl api.<your-domain>/hello
```

### Delete EKS cluster
```bash
$ eksctl delete cluster -f eksctl-cluster.yaml
```