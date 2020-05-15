# Docker Stack Deploy

Almost similar to docker-compose with a few differences.

A few similarities:
- uses docker-compose.yml
- same network, volume, network etc attributes

A few differences:
- One extra option to be used as `network` driver in stacks (overlay. Default for services).

The main difference is `deploy` option in `docker-compose.yml` file.
`deploy` contains information and parameters for docker swarm service.



## Some notes
To use the `docker-compose.yml` file in this folder, we have to use the `eval` method to activate a docker-machine. Because if we ssh into the machine, we cannot access the host filesystem.

## Let's start

First let's create some nodes.
```
docker-machine create default # manager
docker-machine create dockertools.com # worker
```

- Create a swarm from manager node
- Join the worker node in the swarm

- Run the following command from the manager node.

```
docker stack deploy --compose-file <compose file> <stack-name>
```

Now you can run `docker ps` in worked node to see that two containers of `nginx` are running there.

Export port to use curl.

```
docker service update --publish-add 80:80 test_stack_nginx
```

Now you can run `curl localhost` from any node in the stack.

- To view logs of individual service (there is no alternate for `docker-compose logs`)
```
docker service logs <Service-name> -f
```
