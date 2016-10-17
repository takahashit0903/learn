#LDAP
インターネットなどのTCP/IPネットワークでディレクトリサービスにアクセスするための通信プロトコルの一つ。 ディレクトリサービスはネットワークの利用者に関する情報やネットワークに接続された機器、資源に関する情報をサーバ上のデータベースで一元管理する仕組み。

###Install
```
$ sudo yum install openldap openldap-servers openldap-clients
$ rpm -qa | grep openldap
openldap-clients-2.4.40-12.29.amzn1.x86_64
openldap-2.4.40-12.29.amzn1.x86_64
openldap-servers-2.4.40-12.29.amzn1.x86_64
```
###設定用ディレクトリのパスワード設定
最初に設定用ディレクトリを管理するためのパスワードを用意します。  
```
$sudo slappasswd
New password:[パスワード入力]
Re-enter new password:[パスワード入力]
{SSHA}ggVIwIHs8uzTY+0nJSmrsSYD3zTAsJWa
```
パスワードの設定は/etc/openldap/slapd.d/cn=config/olcDatabase={0}config.ldifに行います。次の例のようにolcRootPWという項目を追加し先ほど生成したパスワードを設定します。  
sudo vi /etc/openldap/slapd.d/cn=config/olcDatabase={0}config.ldif  
```
# AUTO-GENERATED FILE - DO NOT EDIT!! Use ldapmodify.
# CRC32 b29a690c
dn: olcDatabase={0}config
objectClass: olcDatabaseConfig
olcDatabase: {0}config
olcAccess: {0}to *  by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=exter
 nal,cn=auth" manage  by * none
olcAddContentAcl: TRUE
olcLastMod: TRUE
olcMaxDerefDepth: 15
olcReadOnly: FALSE
olcRootDN: cn=config
olcRootPW: {SSHA}ggVIwIHs8uzTY+0nJSmrsSYD3zTAsJWa
olcSyncUseSubentry: FALSE
olcMonitoring: FALSE
structuralObjectClass: olcDatabaseConfig
entryUUID: 2cf17ff0-2868-1036-85f2-a38b978935f7
creatorsName: cn=config
createTimestamp: 20161017034731Z
entryCSN: 20161017034731.308254Z#000000#000#000000
modifiersName: cn=config
modifyTimestamp: 20161017034731Z
```
###DB設定
LDAPサーバで利用できるデータベースには幾つかの種類が存在します。ここではバーク レーDBというのを利用しま すがその場合はデータベースがファイルが保存されているディレクトリにキャッシュサイズなどを指定するための設定ファイル「DB_CONFIG」を配置す る必要があります。そこで予め用意されている「DB_CONFIG」のサンプル「/etc/openldap/DB_CONFIG.example」を /var/lib/ldapディレクトリにコピーします。  
```
sudo cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
```
###サービス起動
```
 /etc/rc.d/init.d/slapd start
```
