# docker-compose

複数のコンテナを起動するとき、コンテナごとに構成や起動・停止を管理していると運用が複雑になります。  
そこで、docker-composeを利用すると複数コンテナの一括管理ができるようになります。 
「docker-compose.yml」ファイルにコンテナの構成情報を定義することで、同一のホスト上の複数コンテナを一括管理します。  

## インストール
```
sudo su

インストール
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

実行ファイルにアクセス権を設定
chmod +x /usr/local/bin/docker-compose

インストール確認
docker-compose --version
docker-compose version 1.8.0, build f3628c7
```

## docker-compose.yml
複数のコンテナの設定内容をまとめて1つのファイルに記述します。  

### ベースイメージの指定
image: ベースイメージの指定。 takahashit0903/apache:ver1.0

build: イメージ構成をDockerfileに記述して、それを自動でビルドしてベースイメージに指定する場合、Dockerfileのパスを指定。 .  
Dockerfileの作成
```
FROM ubuntu
```
### コンテナ内で動かすコマンド指定
```
command: /bin/bash
```
### コンテナ間リンク連携
```
links:
  - dbserver
  - dbserver:mysql
```

### コンテナ間の通信
コンテナのポート番号のみを指定した時は、ホストマシンのポートはランダムな値が設定される  
```
ports:
  - "3000"
  - "8000:80"
  - "10000:3306"
```
ホストマシンへのポートを公開せず、リンク機能を使って連携するコンテナのみにポートを公開する時は、exposeを指定
DBサーバのようにWEBアプリケーション機能を持つコンテナを介してのみアクセスを行いたい場合などに利用する  
```
expose:
  - "3000"
  - "8000"
```
### コンテナのデータ管理
コンテナにボリュームをマウントするときは、volusesを指定。
```
volumes:
 - /var/lib/mysql
 - cache/:/tmp/cache
 ホスト側でマウントするパスを指定するには、ホストのディレクトリパス:コンテナのディレクトリパスを指定
 - ~/configs:/etc/configs/:ro
 読み取り専用としてマウントできる。

volumes_from:
 - log

別のコンテナから全てのボリュームをマウントするときは、コンテナ名を指定
```
### コンテナの環境変数指定
```
# 配列形式での指定
enviroment:
 - HOGE=fuga
 - FOO
# ハッシュ形式での指定
enviroment:
 HOGE: fuga
 FOO:
```
ファイルを分けて定義することが可能
```
env_file:
 - ./envfile
 - tmp/envfile2
```
envfile
```
HOGE=foo
FOO=bar
```
