# Installing the Amazon ECS Container Agent
### Launch an Amazon Linux instance with an IAM role that allows access to Amazon ECS.
### Connect to your instance.
### Install the ecs-init package. 
````
sudo yum install -y ecs-init
```
### Start the Docker daemon.
```
sudo service docker start
```
### Start the ecs-init upstart job.
```
sudo start ecs
```
### check
```
$ curl -s http://localhost:51678/v1/metadata | jq .
{
  "Cluster": "cluster name",
  "ContainerInstanceArn": "<container instance arn>",
  "Version": "Amazon ECS Agent - v1.13.0 (aebcbca)"
}
```
