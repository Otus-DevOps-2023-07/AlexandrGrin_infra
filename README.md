# AlexandrGrin_infra
AlexandrGrin Infra repository

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
