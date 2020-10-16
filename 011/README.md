# Nginx Ingress Controller Helm

### Create Kubernetes Cluster on AWS
```bash
$ eksctl create cluster -f 011/eksctl-cluster.yaml
```

### Get values file from
```bash
https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx
```
### Initialize a Helm Chart Repository

```bash
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
```

### Install Nginx Ingress Helm Chart
```bash
$ helm install sample-ingress ingress-nginx/ingress-nginx -f 011/values.yaml
```

### Deploy Sample App
```bash
$ kubectl apply -f 011/sample-app.yaml
```

### Verify DNS
```bash
$ dig +short www.devopsbyexample.io
```

### Clean Up
```bash
$ helm repo remove ingress-nginx
$ eksctl delete cluster -f 011/eksctl-cluster.yaml
```