# Mutlibranch-pipelines

- Create a new Item.
- Select multibranch pipelines
- use the repo as git source:
https://github.com/danialmalik/udemy-docker-az-basic-react-app.git

- Apply and save. It will scan the repo for Jenkinsfile and execute that.

- After running the job, you'll see that `react_stack` stack is deployed and `react_stack_react_nginx.1` container will be running on one of the nodes.
