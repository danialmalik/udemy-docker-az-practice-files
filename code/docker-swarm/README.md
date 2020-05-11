# Docker swarms

### Prerequisites

- docker-machine
https://github.com/docker/machine/releases

(For Mac users)
https://docs.docker.com/docker-for-mac/docker-toolbox/#docker-toolbox-and-docker-desktop-coexistence


### Important commands
- Switch from docker-machine to Docker Desktop on Mac and Windows
```
unset `env | grep DOCKER_ | egrep -o '^[^=]+'`
```

- To use the docker-machine VM as default,
```
eval $(docker-machine env default)
```
_Replace the "default" with your machine name._

### Note that
I am using Mac while doing this so I'll be using a combination of docker-machine and Docker Desktop for the process.
You can find out how to switch between nodes in any other OS and map those commands to do the thing.

You can also use `docker ssh <MACHINE/HOST NAME>` to switch to any host

### Let's start

1. Create a manager node and switch to it.
```
docker-machine create manager
eval $(docker-machine env manager)
```

2. Initialize the swarm
```
docker swarm init
```

if the command throws an error about the IP, use the `--advertise-addr` flag with the command and IP of the interface (preferably the one with the IP starting with 192.168)
```
docker swarm init  --advertise-addr 192.168.99.101
```


This should output something like this
```
Swarm initialized: current node (<NODE ID>) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token <TOKEN> 192.168.99.101:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

3. Now let's create another node.
```
docker-machine create dockertools.com
```

4. SSH OR switch to the manager host OR and get a worker token
```
docker-machine ssh manager # ssh
# OR
# eval $(docker-machine env manager) # other approach
docker swarm join-token worker
exit
```
and copy the command

5. SSH or switch to dockertools.com host
```
docker-machine ssh dockertools.com # ssh
# OR
# eval $(docker-machine env dockertools.com) # other approach

# PASTE THE COMMAND COPIED IN THE PREVIOUS STEP
# HERE
exit
```

6. Now from the manager node, run `docker info` and see that `swarm` status is set to active.
Also you can run `docker node ls` from the manager node to view the nodes.

7. Promote a worker node to manager. (run from a manager node)
```
docker node promote dockertools.com
```

Now check the status of nodes,
```
docker node ls
```

the `manager` status of `dockertools.com` should be `Reachable` now.

To demote, run
```
docker node demote <node_name>
```
