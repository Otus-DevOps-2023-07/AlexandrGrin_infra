#!/bin/bash
sudo apt update
sudo apt install -y mongodb
sudo systemctl enable mongodb
sudo systemctl start mongodb
