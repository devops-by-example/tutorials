# Nginx Admission Webhook | Overview and Demo


### Create namespace
```bash
$ kubectl apply -f 012/ingress-nginx/namespace.yaml
```

### Deploy Nginx Webhook
```bash
$ kubectl apply -f 012/ingress-nginx/admission-webhooks
```

### Deploy Nginx Ingress Using YAML
```bash
$ kubectl apply -f 012/ingress-nginx
```

### Check Ingress pods, service, and webhook
```bash
$ kubectl get pods -n ingress
$ kubectl get svc -n ingress
$ kubectl get ValidatingWebhookConfiguration
```

### Deploy Sample App
```bash
$ kubectl apply -f 012/sample-app.yaml
```

### Verify App
```bash
$ kubectl get pods -n default
$ kubectl get ingress -n default
```