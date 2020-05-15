# Docker Secrets and Configs

- mounted files inside container of a swarm service at runtime
- **Main Difference**
  - location
    - secrets are mounted at /run/secrets/<secret-name>
    - configs default to /<config-name>
  - encryption
    - secrets are encrypted


### Let's start
- Create a secret/config from the swarm's certificate
```
docker swarm ca | docker [secret|config] create swarm_ca - # swarm_ca being the name of secret
```

or

```
docker swarm ca > swarm.cert
docker [secret/config] create swarm_ca swarm.cert
```

- List secrets/configs
```
docker [secret|config] ls
```

- Get extra info about secret/config
```
docker [secret|config] inspect <secret_name>
```


### Using docker-compose

- Deploy stack
```
docker stack deploy --compose-file docker-compose.yml test_stack
```

- Now check that config is created
```
docker config ls
```

- Exec into a service container
```
docker exec -it <container-id> bash
```

- Verify that the config and secret has been copied to root of container.
```
cat /swarm.crt
cat /run/secrets/swarm.crt
```

**Important**
You cannot change existing secret/config and redeploy. To change the config/secret you have to rename the config/secret and then redeploy. And then manually remove the previous secret.
