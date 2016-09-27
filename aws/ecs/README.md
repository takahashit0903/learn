# ECS
Amazon EC2 Container Service


### To install Docker on an Amazon Linux instance

- lanch EC2
- connect to EC2
```
ssh ec2-user@ip-addr
```
- Update the installed packages and package.
```
sudo yum update -y
```
- Install Docker.
```
sudo yum install -y docker
```
- Start the Docker service.
```
 sudo service docker start
```
- sudoを使用せずdockerコマンドを利用できるようになる
```
sudo usermod -a -G docker ec2-user
```
- 新しいdocker権限を拾いあげるために、再ログイン
- sudo なしにコマンドを実行できるか確認
```
docker info
```


### To create a Docker image of a PHP web application

- Install git.
```
$ sudo yum install -y git
```
- Clone the simple PHP application onto your system.
```
$ git clone https://github.com/awslabs/ecs-demo-php-simple-app
```
- 移動
```
$ cd ecs-demo-php-simple-app
```
- docker image build
```
$ docker build -t my-dockerhub-username/amazon-ecs-sample .
```
- image確認
```
$ docker images
REPOSITORY                         TAG                 IMAGE ID            CREATED             SIZE
takahashit0903/amazon-ecs-sample   latest              4c2cb934c1d0        4 minutes ago       228.6 MB
ubuntu                             12.04               a11493a01736        2 days ago          103.6 MB
```
- docker run (ホストシステム上のport80とコンテナのport80をマッピングさせる)
```
docker run -p 80:80 takahashit0903/amazon-ecs-sample
```
- セキュリティグループでhttpを許可
- http://EC2のIP へアクセス
- stop docker
```
Ctrl + c
```

### To register a task definition with the amazon-ecs-sample image

- Register a task definition with the simple-app-task-def.json file.
```
$ aws ecs register-task-definition --cli-input-json file://simple-app-task-def.json
```
- cliでconsole-sample-appを実行
```
aws ecs run-task --task-definition console-sample-app
```

## Getting Started with Amazon ECS

- ECSのランチウィザードからスタート
```
https://console.aws.amazon.com/ecs/home#/firstRun
```
- Select your Amazon ECS first run options.
- Configure repository


# Cleaning Up your Amazon ECS Resources


Amazon EC2 instances, Elastic Load Balancing load balancers, and Auto Scaling groups
->  EC2のコンソールから手動で削除が必要

- Scale Down Services
サービス（sample-web）のタスクカウントを0にする
```
aws --region ap-southeast-2 ecs update-service --cluster default --service sample-webapp --desired-count 0
```

- Delete Services
defaultkクラスタのサービス（sample-web）を削除
```
aws  --region ap-southeast-2 ecs delete-service --cluster default --service sample-webapp
```

- Deregister Container Instances
クラスタ削除の前に内部のコンテナインスタンスの登録を解除する必要がある
```
aws --region ap-southeast-2 ecs deregister-container-instance --cluster default --container-instance XXXXX --force
```

- Delete a Cluster
```
aws --region ap-southeast-2 ecs delete-cluster --cluster default
```

- Delete TaskDeinitions
Task Definitionの削除
```
aws --region [region] ecs deregister-task-definition --task-definition [task name]:[revision]
```





