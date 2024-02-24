#! /bin/bash

apt update
apt install apache2 -y
systemctl enable apache2
systemctl start apache2
