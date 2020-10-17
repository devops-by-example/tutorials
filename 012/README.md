# Nginx Ingress Controller Helm

### Create Kubernetes Cluster on AWS
```bash
$ eksctl create cluster -f 011/eksctl-cluster.yaml
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