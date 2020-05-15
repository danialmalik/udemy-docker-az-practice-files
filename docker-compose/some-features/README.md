## Some features

### Build
- To make images using a dockerfile use `build` parameter in docker-compose.yml file.
- If anything in Dockerfile changes, docker-compose will not detect it. Therefore use the following command to rebuild docker image everytime,
```
docker-compose up --build
```


- To **only build** the services that have `build` parameter in the file,
```
docker-compose build [service_name]
```

- To **only pull** the services that have `image` parameter in the file,
```
docker-compose pull [service_name]
```

**Note**: if both `image` and `build` options are present in a service, an image is built using the
Dockerfile and `image` is used to tag that build image.

One thing to note here is that if there is already an image with `image` tag provided, the image will not be build using the Dockerfile and instead that already present image will be used.

e.g. If there is a `nginx:latest` image already present in the system, and we use this as `image` tag alongwith `build` parameter, the `build` parameter will be ignored. but if we change that tag to `_nginx:latest`, docker-compose will build using the Dockerfile and tag that image with `_nginx:latest`.

- Pause/Un-pause a container
```
docker-compose pause|unpause [service name]
```

- Docker events
```
docker|docker-compose events
```

- Docker-compose logs
```
docker-compose logs [service name] [-f]
```
