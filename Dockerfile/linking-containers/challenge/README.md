# Challenge
Access mysql container from another container.


## Solution
1. Run mysql container
```
docker run -d --rm --name our-mysql -e MYSQL_ROOT_PASSWORD=password mysql:5.6
```

2. Run adminer container that will access mysql.
```
docker run --link our-mysql:db -p 8088:8080 adminer
```

3. Access adminer on localhost:8088
