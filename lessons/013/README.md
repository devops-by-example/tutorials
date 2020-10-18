# How to Monitor Nginx Ingress with Prometheus and Grafana

### Create Kubernetes Cluster
```bash
$ eksctl create cluster -f lessons/013/00-eksctl/eksctl-cluster.yaml
$ kubectl get svc -n default
```

---

### Create CRD (Custom Resource Definitions) for Prometheus Operator
```bash
$ kubectl apply -f lessons/013/01-prometheus-operator-crd
```

### Deploy Prometheus Operator
```bash
$ kubectl apply -f lessons/013/02-prometheus-operator
$ kubectl get pods -n default
```

###  Deploy Prometheus
```bash
$ kubectl apply -f lessons/013/03-prometheus
$ kubectl get pods -n default
$ kubectl logs -f prometheus-prometheus-0 prometheus
```

---

### Create Namespace Ingress
```bash
$ kubectl apply -f lessons/013/04-ingress-nginx/namespace.yaml
```

### Deploy Nginx Admission Webhook
```bash
$ kubectl apply -f lessons/013/04-ingress-nginx/admission-webhooks
```

### Deploy Nginx Ingress Controller
```bash
$ kubectl apply -f lessons/013/04-ingress-nginx
$ kubectl get pods -n ingress
```

---

### Create ServiceMonitor for Nginx Controller
```bash
$ kubectl apply -f lessons/013/05-servicemonitor
$ kubectl get servicemonitors
```

### Check Prometheus Targets
```bash
$ kubectl port-forward svc/prometheus 9090:9090 -n default
```

---

### Deploy Sample App
```bash
$ kubectl apply -f lessons/013/07-sample-app
$ kubectl get pods -n default
$ kubectl get ingress -n default
```

### Create DNS record
```bash
$ kubectl get svc -n ingress
```

---

### Deploy Grafana
```bash
$ kubectl apply -f lessons/013/06-grafana
$ kubectl get pods -n default
```

### Import Ingress Grafana Dashboard

```bash
# Grafana Dashboard: https://grafana.com/grafana/dashboards/9614
$ kubectl port-forward svc/grafana 3000 -n default
```

### Verify DNS
```bash
$ dig +short www.devopsbyexample.io
```

### Script to simulate 2xx requests
```bash
while true
do
  sleep 1
  curl -I http://www.devopsbyexample.io
done
```

### Script to simulate 5xx requests
```bash
while true
do
  sleep 1
  curl -I http://www.devopsbyexample.io/do-not-exists
done
```

# Cleanup
```bash
$ eksctl delete cluster -f lessons/013/00-eksctl/eksctl-cluster.yaml
```