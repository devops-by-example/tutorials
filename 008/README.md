### Build docker based on alpine

```bash
docker build -t app:alpine -f Dockerfile.alpine .
docker run --rm -p 8081:8081 app:alpine
```

### Build docker based on scratch

```bash
docker build -t app:scratch -f Dockerfile.scratch .
docker run --rm -p 8081:8081 app:scratch
```
