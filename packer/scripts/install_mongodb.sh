#!/bin/bash
apt update
sleep 10
apt install -y mongodb
sleep 10
systemctl enable mongodb
sleep 10
systemctl start mongodb
sleep 10
