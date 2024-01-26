#!/bin/bash
po=$(cat /etc/ssh/sshd_config | grep "^Port")
pport=$(echo "$po" | sed "s/Port //g")
if [ -z "$port" ]
then
sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
po=$(cat /etc/ssh/sshd_config | grep "^Port")
pport=$(echo "$po" | sed "s/Port //g")
fi
apt update -y
apt install ufw  -y
ufw allow from any to any port $pport proto tcp
sudo ufw allow $pport
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 80/udp
sudo ufw allow 443/tcp
sudo ufw allow 443/udp
sudo ufw allow 7300/tcp
sudo ufw allow 7300/udp
sudo ufw allow 7575/tcp
sudo ufw allow 14000/tcp
sudo ufw allow 56777/tcp
ufw enable
