# docker

軽量な仮想化環境  
Build once, run anywhere  

## インストール
```
sudo yum install docker
sudo chkconfig docker on
sudo service docker start
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

- Dockerfile
```
Dockerコンテナーの構成内容をまとめて記述するシンプルなテキスト形式のファイル
1行につき1つの操作を｛命令｝と｛引数｝でスペース区切りで記述
```
- docker build
```
Dockerコンテナーの起動、構成、Dockerイメージの作成まで一気に実行
```

