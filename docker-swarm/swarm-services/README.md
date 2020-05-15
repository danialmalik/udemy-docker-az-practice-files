# Docker services

Docker services are almost similar to docker-compose services but are independent of any file.

### Services

To create a service,
- ssh into the node
```
docker-machine ssh
```
- Create a service
```
docker service create nginx
```

This will create a service using nginx image.

- List services
```
docker service ls
```

- Check status of one service (service name  can be obtained using the command above)
```
#  docker service ps <service-NAME>
```
from here, we can get the node on which the service is running.

### Service replicas

- Increase replicas/instances of service
```
docker service update --replicas 2 SERVICE_NAME
```
OR
```
docker service scale SERVICE_NAME=2
```

Now check using `docker service update --replicas 2 <service-name>` command that there are two replicas of the service running. In the output, you will notice that the other replica is created under the manager node to evenly balance the load.


- Add a port to the service so that we can test it.
```
docker service update --publish-add 8088:80 <service-name>
curl localhost:8088
```


- Docker service auto load balances among all the NODES. which means if there is a service running on one node only, you can access it from the other node too. To test it,
```
# Assuming that from the previous steps, there are two replicas of nginx. One on each node.

# First close nginx from one node
docker-machine ssh dockertools.com
docker service update --replicas 1 <service-name>
docker service ps <Service-name>

# or
# docker ps
# to see if a container is running on current node.

# open the node in which there is no nginx service running (`docker ps`  returns nothing)
curl localhost:8088
```

it will still get output from nginx on the other node. In a cluster, every node knows about the other node.

### Service constraints
https://docs.docker.com/engine/reference/commandline/service_create/#specify-service-constraints---constraint

Add some constraints to services.

- Update replicas to 3
```
docker service update --replicas 3 <service-name>
```


- Add constraint
```
docker service update --constraint-add "node.hostname=dockertools.com" <service-name>
```

now all replicas will be deployed to node with hostname "dockertools.com" while "manager" will have none

- Add constraint to deploy only on "manager" nodes
```
docker service update --constraint-add "node.role=manager" <service-name>
```

- **Rollback** last change
```
docker service rollback <service-name>
```
