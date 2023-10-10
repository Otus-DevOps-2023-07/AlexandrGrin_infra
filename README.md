# AlexandrGrin_infra
AlexandrGrin Infra repository

#HW 9
Выполнено:
 - Перенес созданные плейбуки в раздельные роли.
 - Описал два окружения.
 - Использовал Ansible Vault для окружений.

#HW 9
Выполнено:
 - Изучены плейбуки, хендлеры и шаблоны для конфигурации окружения и деплоя тестового приложения. Подход один плейбук, один сценарий (play).
 - Изучен подход один плейбук, но много сценариев.
 - Изучен подход создания множества плейбуков.
 - Изменен провижн образов Packer на Ansible-плейбуки.

#HW 8
Выполнено:
 - Установлен Ansible.
 - Выполнено знакомство с базовыми функциями и инвентори ansible.
 - Выполнено знакомство с различными модулями на подготовленной в прошлых ДЗ инфраструктуре.
 - Написан простой плейбук.

#HW 7
Выполнено:
 - Прослежена зависимость создания ресурсов средствами terraform
 - Создано несколько ВМ и выполнена разбивка конфигурации по файлам
 - Настроено создание ВМ с помощью модулей
 - Проверена работа модулей для разных сред

#HW 6
Выполнено:
 - Установлен terraform
 - Настроен Provider yandex
 - Изучены основные принципы работы с terraform: создана ВМ, настроены provision, проведена работа с переменными.
 - Выполнены задания со * по разворачиванию нескольких копий ВМ. Вариант с копированием кода неудобен, так как в случае создания ВМ в большем количестве код становится плохо читаем из-за громоздкости.
 - Выполнено задание со * по созданию балансировщика. Проверена его работа.


#Исследоватþ способ подклĀчениā к someinternalhost в одну команду из вашего рабочего устройства

ssh -J appuser@158.160.99.141 appuser@10.128.0.3

#Предложитþ вариант решениā длā подклĀчениā из консоли при помощи командý вида ssh someinternalhost из локалþной консоли рабочего устройства, чтобý подклĀчение вýполнāлосþ по алиасу someinternalhost

echo "Host bastion
        Hostname 158.160.99.141
        User appuser
        IdentityFile /home/user/.ssh/id_ed25519
        Port 22

Host someinternalhost
        Hostname 10.128.0.3
        User appuser
        IdentityFile /home/user/.ssh/id_ed25519
        Port 22
        ProxyCommand ssh -W %h:%p bastion
" > ~/.ssh/config

ssh someinternalhost

#user@user-VirtualBox:~$ ssh someinternalhost
#Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-156-generic x86_64)
#
#appuser@someinternalhost:~$ hostname
#someinternalhost

bastion_IP = 158.160.99.141
someinternalhost_IP = 10.128.0.3

#ДЗ #4
testapp_IP = 158.160.61.157
testapp_port = 9292

#startup script

yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --core-fraction 50 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=15GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --preemptible --metadata serial-port-enable=1  --metadata-from-file user-data=startup-script.yaml

#HW 5
Выполнено:
 - Установлен Packer
 - Создан сервисный сервисный аккаунт yc
 - Созданы файлы шаблонов Packer
 - Разобраны параметры запуска утилит Packer
 - Собраны образы дисков
 - Проверена работа образов дисков
 - Выполнено параметризирование шаблона
 - Построен bake-образ диска ВМ
 - Разработана автоматизация создания ВМ

Запуск генерации "жареного" образа диска:
из директориии packer:
packer build -only '*ubuntu16' .

Запуск генерации "печеного" образа диска:
из директориии packer:
packer build -only '*ubuntu16full' .

Запуск скрипта создания ВМ:
из директории /packer/config-scripts:
./create-reddit-vm.sh
