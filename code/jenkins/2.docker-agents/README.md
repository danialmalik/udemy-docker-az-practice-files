# Mutlibranch-pipelines using docker agents

Running build steps inside a docker container.


## Prerequisites
- Install node using "manage tools" setting.
- Manage jenkins -> Configure System ->
  - Add "docker.io docker" in `Labels` field

  - Pipeline Model Definition -> Docker Label
    - set "docker.io"
- Manage Jenkins -> Global Tools -> Docker
  - Add docker with name "docker" and empty "installation path" because we will be using host's docker



## Let's start

- Create a new Item.
- Select multibranch pipelines
- use the repo as git source:
https://github.com/danialmalik/udemy-docker-az-practice-files.git

- Apply and save. It will scan the repo for Jenkinsfile and execute that.

- After running the job, you'll see that `react_stack` stack is deployed and `react_stack_react_nginx.1` container will be running on one of the nodes.
