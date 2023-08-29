#!/bin/bash

#Если образ уже существует, блок создания образа следует закомментировать

#Создание образа
cd ..
packer build -only '*ubuntu16full' .

#Создание ВМ
YC_IMAGE_ID=$(yc compute image list | grep "reddit-full" | awk '{print $2}')
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --core-fraction 50 --create-boot-disk image-folder-id=standard-images,image-id=$YC_IMAGE_ID,size=15GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --preemptible --metadata serial-port-enable=1 --ssh-key ~/.ssh/id_ed25519.pub
