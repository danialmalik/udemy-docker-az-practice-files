# Linking two containers

Here we will link nginx container and a ubuntu container.

# How to run
1. Create the nginx container.
```
docker build . -t learning-linking:latest
```

2. Run the nginx container
```
docker run -d --rm -p 80:80 --name reuse-nginx learning-linking:latest
```

3. Run ubuntu container that will access the nginx container
```
docker run -it --rm --link reuse-nginx curlimages/curl:latest /bin/bash
```

4. Install curl in container
```
apt-get update && apt-get install curl -y --no-install-recommends
```

5. Access the other container using curl
```
 curl reuse-nginx:80/webapp.html
```
