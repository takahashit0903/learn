# docker

コンテナ(Docker)は、起動早い、リソース消費が少ない、OSはLinuxのみ
軽量な仮想化環境  
Build once, run anywhere  

- コンテナ  
dockerイメージから作られ、実行される仮想環境  

- dockerイメージ  
コンテナのファイルシステム、設定をひとまとめに保存している

- dockerサーバ  
docker本体ともいえる、コンテナ・イメージの管理を行うサービス  

- docker hub(レジストリ)  
docker イメージを集めたサイト


## インストール
```
sudo yum install docker
sudo chkconfig docker on
sudo service docker start
sudo usermod -a -G docker [ユーザ]
```

## 基本コマンド

### コンテナの一覧
- 実行中のコンテナ一覧を表示します。(-aで停止しているコンテナも表示)
```
docker ps
```
### imageを取得
- docker pull
```
取得可能なimageの一覧 https://hub.docker.com/explore/
docker pull centos
```
### imageのリスト確認
- docker images

### imageからcontainerを作成し、container内のshellに入る
```
docker run -it centos /bin/bash
```
### コンテナの停止
```
docker stop centos
```
###  コンテナimageの保存
```
dodcker commit centos  リポジトリ:タグ名
```
### コンテナの削除
```
docker rm centos
```
### コンテナimageの削除
```
docker rmi イメージID
```
### コンテナ内のhttpdログファイルをホストの/tmpへコピー
```
docker cp タグ名:/var/log/httpd /tmp
```
### docker hubへ保存
```
docker push リポジトリ:タグ名
```
### ローカルにリポジトロリ単位で保存
```
docker save リポジトリ | gzip > ファイル.tgz
```
### saveしたコンテナイメージを登録
```
docker load -i ファイル.tgz
```

## コンテナイメージの自動生成
- Dockerfile
```
Dockerコンテナーの構成内容をまとめて記述するシンプルなテキスト形式のファイル
1行につき1つの操作を｛命令｝と｛引数｝でスペース区切りで記述
```

|命令|説明|
|---|---|
| FROM | 作成元のコンテナイメージを「リポジトリ:タグ名」で指定 |
| MAINTAINER | コンテナイメージ作成者の名前を記載 |
| ENV | コマンド実行時の環境変数を設定 |
| RUN | 指定のコマンドを実行 |
| ADD | イメージ内にファイルを追加 |
| EXPOSE | コンテナ内のアプリケーションが使用するポート番号を登録 |
| CMD | コンテナ起動時に実行するコマンドを指定 |
| WORKDIR | コマンドを実行する際のカレントディレクトリを指定 |
| VOLUME | ホストLINUXのディレクトリを割り当てるディレクトリを指定 |

- docker build
```
ディレクトリパス内のファイルを用いてコンテナimageを作成した後、リポジトリとタグ名を付与
中間イメージを再利用せず、最初からコンテナイメージの作成をやり直す場合は、「--no-cache」オプションを指定する

docker build -t リポジトリ:タグ名 ディレクトリパス
```

