# Volume

Access a shared file in the container.

Run the following command to run a container interactively and share a file within the container.

> You can use any node version that you have or want to install
```
docker run -it --rm -v "$(pwd)/index.js:/home/index.js" node:10.15.1 /bin/bash
```
