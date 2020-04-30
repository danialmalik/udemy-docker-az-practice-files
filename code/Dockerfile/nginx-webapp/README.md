# How to run

1. Build the image
```
docker build . -t learning-nginx-webapp:latest
```

2. Run the image in a container
```
docker run -p 80:80 learning-nginx-webapp:latest
```

Detached mode
```
docker run -d -p 80:80 learning-nginx-webapp:latest
```

3. Access localhost/webapp.html in any browser
