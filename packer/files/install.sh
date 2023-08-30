#!/bin/bash
apt update
sleep 10
apt install -y ruby-full ruby-bundler build-essential mongodb git
sleep 10
systemctl enable mongodb
sleep 10
systemctl start mongodb
sleep 10
cd / && git clone -b monolith https://github.com/express42/reddit.git && cd reddit && bundle install
sleep 10
echo "[Unit]
Description=puma

[Service]
ExecStart=/usr/local/bin/puma
WorkingDirectory=/reddit

[Install]
WantedBy=multi-user.target

" > /etc/systemd/system/puma.service
sleep 10
systemctl enable puma
sleep 10
systemctl start puma
