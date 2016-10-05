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
###  コンテナの保存
```
dodcker commit centos  リポジトリ:タグ名
```
### コンテナの削除
```
docker rm centos
```
### コンテナ内のhttpdログファイルをホストの/tmpへコピー
```
docker cp タグ名:/var/log/httpd /tmp
```
### docker hubへ保存
```
docker push リポジトリ:タグ名
```

## コンテナイメージの自動生成
- Dockerfile
```
Dockerコンテナーの構成内容をまとめて記述するシンプルなテキスト形式のファイル
1行につき1つの操作を｛命令｝と｛引数｝でスペース区切りで記述
```
- docker build
```
Dockerコンテナーの起動、構成、Dockerイメージの作成まで一気に実行
```

