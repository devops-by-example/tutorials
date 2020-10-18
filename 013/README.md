# How to Monitor Nginx Ingress with Prometheus and Grafana

### Create Kubernetes Cluster
```bash
$ eksctl create cluster -f 013/eksctl-cluster.yaml
```

### Create CRD (Custom Resource Definitions)
```bash
$ kubectl apply -f 013/prometheus-operator-crd
```

### Create RBAC (Role-based access control)
```bash
$ kubectl apply -f 013/rbac/prometheus-operator-crd
$ kubectl apply -f 013/rbac/prometheus-operator
$ kubectl apply -f 013/rbac/prometheus
```

### Deploy Prometheus
```bash
$ kubectl apply -f 013/prometheus
```

### Check Prometheus
```bash
$ kubectl get pods -n default
$ kubectl logs -f prometheus-prometheus-0 prometheus
```

### Create Namespace Ingress
```bash
$ kubectl apply -f 013/ingress-nginx/namespace.yaml
```

### Deploy Nginx Admission Webhook
```bash
$ kubectl apply -f 013/ingress-nginx/admission-webhooks
```

### Deploy Nginx Ingress Controller
```bash
$ kubectl apply -f 013/ingress-nginx
```

### Check Nginx Controller
```bash
$ kubectl get pods -n ingress
```

### Create ServiceMonitor for Nginx Controller
```bash
$ kubectl apply -f 013/servicemonitor
```

### Check Prometheus Targets
```bash
$ kubectl port-forward svc/prometheus 9090:9090 -n default
```

### Create DNS record
```bash
$ kubectl get svc -n ingress
```

### Deploy Grafana
```bash
$ kubectl apply -f 013/grafana
$ kubectl get pods -n default
```

### Import Ingress Grafana Dashboard

```bash
# Grafana Dashboard: https://grafana.com/grafana/dashboards/9614
$ kubectl port-forward svc/grafana 3000 -n default
```

### Deploy Sample App
```bash
$ kubectl apply -f 013/sample-app
```

### Check Sample App
```bash
$ kubectl get pods -n default
$ kubectl get ingress -n default
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

### Cleanup
```bash
$ eksctl delete cluster -f 013/eksctl-cluster.yaml
```