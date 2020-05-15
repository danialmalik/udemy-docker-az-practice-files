# Volumes

1. start the containers
```
docker-compose up -d
```

2. exec into the container.
```
docker exec -it volumes_nginx_1 bash
```

3. Make an html file inside vol (our volume) directory
```
echo "Persistent hello" > /usr/share/nginx/html/vol/abc.html
```

4. Make another html file outside vol directory
```
echo "Not Persistent hello" > /usr/share/nginx/html/abc.html
```

5. Access the files in the browser at urls
```
http://localhost:8088/vol/abc.html
http://localhost:8088/abc.html
```

6. Now exit, delete and recreate the container and try to access both URLs again. You'll see that only the html file inside vol directory is persistent.
