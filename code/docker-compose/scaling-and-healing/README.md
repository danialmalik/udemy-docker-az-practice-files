# Scaling docker containers

1. start the container
```
docker-compose up -d
```

2. Scale a running service

_Deprecated_
```
docker-compose scale nginx=3
```

_Currently supported_
```
docker-compose up -d --scale nginx=4
```

3. get into a ubuntu image with curl installed
```
docker run --rm -it --network scaling-and-healing_default ubuntu:latest bash
apt-get update && apt-get install curl -y --no-install-recommends
```

4. Hit nginx containers with curl multiple times. There will be different hostnames due to load balancing.
```
curl nginx/hostname
```
