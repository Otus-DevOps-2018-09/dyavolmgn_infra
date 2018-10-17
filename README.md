# dyavolmgn_infra
dyavolmgn Infra repository

Самостоятельное задание:
1. ssh в одну команду.
ssh 10.142.0.2 -o "proxycommand ssh -W %h:%p  104.199.93.123"


2.  ssh someinternalhost
add  ~/.ssh/config

Host bastion
  Hostname 104.199.93.123
  User user
  IdentityFile  ~/.ssh/id_rsa
Host someinternalhost
  Hostname 10.142.0.2
  IdentityFile  ~/.ssh/id_rsa
  User user
  ProxyCommand ssh -W %h:%p  user@bastion

задание:

bastion_IP = 104.199.93.123
someinternalhost_IP = 10.142.0.2

bastion - истользуется как точка входа, на нем поднят VPN для доступа в локальную сеть.
someinternalhost - host в локальной сети, без доступа из внешнего мира.
Достув на ВМ по ssh_key.
