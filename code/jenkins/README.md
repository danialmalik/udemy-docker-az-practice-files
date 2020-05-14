# Jenkins
https://github.com/jenkinsci/docker/blob/master/README.md

- Install and run jenkins using the command below (official command from the documentation)
```
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
```
**But** we want to run docker commands in jenkins container so we will make some customizations.
To run our custom version,
```
docker-compose up -d
```

- If you open the jenkins logs (`docker logs jenkins_1 -f`), there you will see the administrator password to access jenkins first time.
a1d6106f22744154836b3bbed965e4a5

- Access jenkins on localhost:8080

**OR** if you are using docker-machine to run jenkins, run command:

```
docker-machine ip [machine-name]
```
to get the IP of machine. Then open `<IP-of-machine>:8080` in browser to open jenkins
