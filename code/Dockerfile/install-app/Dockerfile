FROM ubuntu:latest

RUN apt-get update && apt-get install -y vim --no-install-recommends && apt-get clean

CMD echo $(which vim)
