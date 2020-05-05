# Networks

- List current networks
```
docker network ls
```

- delete unused networks
```
docker network prune
```

- Connect a container with an existing network
```
docker network connect <network-name or id> <container-name or id>
```

- Run a container in a network
```
docker run --network <network-name or id> <image-name or id>
```

- inspect a network
```
docker network inspect <network-name or id>
```
