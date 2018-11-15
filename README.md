# dyavolmgn_infra
dyavolmgn Infra repository

## Ansible-2

### Практика
 - Создал плейбуки, установил тэги. 
 - Создал мультиплейбук
 - Создал плейбук site.yml, добавив в него импорт app.yml, db.yml и deploy.yml 

## Ansible-1

### Простой плейбук
* ansible-playbook clone.yml - слонирует репозиторий, когда его нет. В случае если он есть то выполнение таска пропускается. 

## Terraform 2

* Созданы модули и оптимизированы. 
* Использован модуль gcs bucket.
* Шаблоны разбиты на stage и prod.

### Задание со * 

* В gcloud вручную(не терраформом) создан storage для синхронизации tfstate.
* При подключении rb terraform предложил перенести файлы состояния в облако. Благодаря этому при запуске из любых мест состояние всегда синхронизировано.
* В процессе выполнения ДЗ в качестве эксперимента провёл миграцию с одного облачного backend-а на другой.
* При одновременной попытке прменить изменения во втором случае возникает ошибка `Error locking state: Error acquiring the state lock` которая указывает на то, кто и как изменяет состояние системы.


------
### Terraform 1
Создан шаблон terraform.
Развертывание инстанса reddit-app, и управление конфигурацией.
Создан шаблон для firewall-а.
Шаблоны параметризованны.

##Задание со *
доступ к узлу:
ssh -i ~/.ssh/appuser appuser@HOST_IP
ssh -i ~/.ssh/appuser appuser1@HOST_IP
ssh -i ~/.ssh/appuser appuser2@HOST_IP

##Задание с **
Создан load-balancer перенаправляющий запросы со своего ип на один из инстансов.

------
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

------
testapp_IP = 130.211.103.253
testapp_port = 9292

##  GCP cread VM
Создание инстанса
```
gcloud compute instances create reddit-app \ 
 --boot-disk-size=10GB \ 
 --image-family ubuntu-1604-lts \ 
 --image-project=ubuntu-os-cloud \ 
 --machine-type=g1-small \ 
 --tags puma-server \ 
 --restart-on-failure \ 
 --zone=europe-west1-b \
 --metadata-from-file startup-script=/SCRIPT/startup_script.sh
```
## GCP firewall
```
gcloud compute --project=infra-219508 firewall-rules create default-puma-server \
 --allow=tcp:9292 \
 --target-tags=puma-server \
 --direction=IN
```

