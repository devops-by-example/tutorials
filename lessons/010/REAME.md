# Nginx Ingress Controller Minikube

### Create Minikube Cluster
```bash
$ minikube start --vm=true
```

### Enable the NGINX Ingress controller
```bash
$ minikube addons enable ingress
```

### Verify that the NGINX Ingress controller is running
```bash
$ kubectl get pods -n kube-system
```

### Create hello-world deployment
```bash
$ kubectl apply -f 010/deployment.yaml
```

### Create hello-world service
```bash
$ kubectl apply -f 010/service.yaml
```

### Create hello-world ingress
```bash
$ kubectl apply -f 010/ingress.yaml
```

### Install dnsmasq
```bash
$ brew install dnsmasq
```

### Start dnsmasq
```bash
$ sudo brew services start dnsmasq
```

### Get minikube IP for service
```bash
$ minikube service hello-app-service --url
```

### Configure dnsmasq
```bash
cat << EOF > /usr/local/etc/dnsmasq.d/development.conf
address=/.pvt/192.168.64.4
EOF
```

### Restart dnsmasq
```bash
$ sudo brew services restart dnsmasq
```

### Only send .pvt queries to dnsmasq
```bash
sudo mkdir /etc/resolver
sudo vim /etc/resolver/pvt
nameserver 127.0.0.1
```

### Check resolvers
```bash
scutil --dns
```

### Test DNS name
```bash
$ dig hello-world.pvt @127.0.0.1
```

### Cleanup
```bash
$ minikube delete
```
