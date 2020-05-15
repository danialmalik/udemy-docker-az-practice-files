# Installing any app

1- Build
```
docker build . -t learning-app-install:latest
```

2- Run in non interactively
```
docker run --rm  learning-app-install:latest
```

3- Run interactively
```
docker run -it --rm  learning-app-install:latest /bin/bash
```

4- Try running vim
