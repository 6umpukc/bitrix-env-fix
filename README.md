
# Bitrix-Env на WSL

1. Установить из Microsoft Store - Oracle Linux 9.4 ( https://apps.microsoft.com/detail/9pmc1fjr3jf3?hl=en-US&gl=US ) или AlmaLinux OS 9 ( https://apps.microsoft.com/detail/9p5rwlm70sn9?hl=ru-ru&gl=US )

2. Залогинится под рутом и добавить конфиг для включения systemd в /etc/wsl.conf
```
[boot]
systemd=true
```
3. Включить Remi Repo и установить wget (если не установлен)
```
dnf install http://rpms.remirepo.net/enterprise/remi-release-9.rpm
dnf install wget
```
4. Перед установкой окружения (на чистой ОС) запустить скрипт `./percona_from_yandex.sh` (для смены на зеркала Яндекс)

5. Выполнить установку Bitrix-Env
```
wget https://repo.bitrix.info/dnf/bitrix-env-9.sh
chmod +x bitrix-env-9.sh
./bitrix-env-9.sh`
```

5. Через пунт меню [Manage localhost] - задать имя localhost = bitrix24

6. Через пункт меню [Create Management pool of server] - cоздать пул c названием = bitrix24

## Установка на LXD
```
lxc launch images:oracle/9 centos
```
