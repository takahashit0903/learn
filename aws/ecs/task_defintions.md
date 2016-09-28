# Task Definitions

Dockerコンテナを実行するために必要  
指定できるパラメータは下記のようなもの  

* taskのコンテナで使用するDockerイメージ
* 各コンテナでどのくらいCPUとメモリを使用するか
* taskとコンテナが紐づけられているか
* コンテナで使用するDockerネットワークモード
* コンテナインスタンスのポートとホストのポートのマッピング設定
* コンテナが終了または失敗した場合にタスクが実行を継続する必要があるかの設定
* 開始した時にコンテナが実行するコマンド
* 環境変数
* IAMロール

タスク定義に複数のコンテナおよびデータボリュームを定義することができる。  

# Application Architecture

* A front-end service that displays information on a web page
* A back-end service that provides APIs for the front-end service
* A data store

開発環境では、おそらくあなたのデッカーホスト上で一緒にすべての3つのコンテナを実行します。  
このアプローチは幾つか欠点もある。  

* 1コンポーネントへの変更が、3つすべてのコンポーネントに影響を与える
* スケールすることが困難
* Task Difinitionは10定義しかもてない
* コンテナが同じインスタンスに立たなければいけないので、インスタンスの選択肢が制限されるかもしれない

その代わりに、そのグループ共通の目的のために使用されているコンテナをタスク定義を作成し、複数のタスク定義に異なる成分を分離する必要があります。この例では、3つのタスク定義は、それぞれ一つの容器を指定してください。例クラスタは、以下の3つのフロントエンドサービスコンテナ、2つのバックエンドサービスコンテナ、および1つのデータ・ストア・サービスコンテナに登録3コンテナインスタンスを持っています。

あなたのタスク定義を持っていたら、目的の作業の可用性を維持するためにそれらのサービスを作成することができます。詳細については、サービスの作成。あなたのサービスでは、あなたは、弾性負荷分散のロードバランサを持つコンテナを関連付けることができます。詳細については、サービスの負荷分散を。アプリケーションの要件が変更されると、あなたは上下に希望するタスクの数を拡張するために、またはあなたのタスクでコンテナの新しいバージョンを展開するために、あなたのサービスを更新することができます。詳細については、サービスの更新。

# Create Task Definition

空のタスク定義のテンプレートを以下に示します。あなたは、コンソールJSON入力エリアに貼り付けたり、ファイルに保存され、AWSのCLIで使用することができ、あなたのタスク定義を作成するには、このテンプレートを使用することができます--cli-input-json オプションを選択します
次のAWS CLIコマンドを使用して、タスク定義のテンプレートを生成することができます。
```
$ aws ecs register-task-definition --generate-cli-skeleton
```
template
```
{
    "family": "",
    "taskRoleArn": "",
    "networkMode": "",
    "containerDefinitions": [
        {
            "name": "",
            "image": "",
            "cpu": 0,
            "memory": 0,
            "memoryReservation": 0,
            "links": [
                ""
            ],
            "portMappings": [
                {
                    "containerPort": 0,
                    "hostPort": 0,
                    "protocol": ""
                }
            ],
            "essential": true,
            "entryPoint": [
                ""
            ],
            "command": [
                ""
            ],
            "environment": [
                {
                    "name": "",
                    "value": ""
                }
            ],
            "mountPoints": [
                {
                    "sourceVolume": "",
                    "containerPath": "",
                    "readOnly": true
                }
            ],
            "volumesFrom": [
                {
                    "sourceContainer": "",
                    "readOnly": true
                }
            ],
            "hostname": "",
            "user": "",
            "workingDirectory": "",
            "disableNetworking": true,
            "privileged": true,
            "readonlyRootFilesystem": true,
            "dnsServers": [
                ""
            ],
            "dnsSearchDomains": [
                ""
            ],
            "extraHosts": [
                {
                    "hostname": "",
                    "ipAddress": ""
                }
            ],
            "dockerSecurityOptions": [
                ""
            ],
            "dockerLabels": {
                "KeyName": ""
            },
            "ulimits": [
                {
                    "name": "",
                    "softLimit": 0,
                    "hardLimit": 0
                }
            ],
            "logConfiguration": {
                "logDriver": "",
                "options": {
                    "KeyName": ""
                }
            }
        }
    ],
    "volumes": [
        {
            "name": "",
            "host": {
                "sourcePath": ""
            }
        }
    ]
}

Register a task definition with the simple-app-task-def.json file.
```
$ aws ecs register-task-definition --cli-input-json file://simple-app-task-def.json
```

ECSでタスクを実行する前にクラスタのコンテナインスタンスを起動させる必要がある。
タスク実行コマンド
```
$ aws ecs run-task --task-definition console-sample-app
```

# Task Difinitions Parameter

family,taskRoleArn,containerDefinitions,Volume の4つの基本的な部分に分割される。  


