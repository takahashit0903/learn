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
