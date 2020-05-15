# How to run

1. Build the image
```
docker build . -t learning-healthcheck:latest
```

2. Run the image in a container
```
docker run -p 80:80 learning-healthcheck:latest
```

Detached mode
```
docker run -d -p 80:80 learning-healthcheck:latest
```

3. Access localhost/webapp.html in any browser

4. Run the following command and you will see the health of container.
```
docker ps
```

Open the logs and you will also see that there is a page hit every 15 seconds.
