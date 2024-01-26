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
url="https://www.ipdeny.com/ipblocks/data/countries/ir.zone"
allcount=$(curl -s "$url" | wc -l)
curl -s "$url" | while IFS= read -r line; do
((++line_number))
sudo ufw deny out from any to $line
clear
echo "Iran IP Blocking ( List 1 ) : $line_number / $allcount "
done
url="https://raw.githubusercontent.com/0nec1ick/IP-IR/main/ips.txt"
allcount=$(curl -s "$url" | wc -l)
curl -s "$url" | while IFS= read -r line; do
((++line_number))
sudo ufw deny out from any to $line
clear
echo "Iran IP Blocking ( List 2 ) : $line_number / $allcount "
done
url="https://raw.githubusercontent.com/0nec1ick/IP-IR/main/i.txt"
allcount=$(curl -s "$url" | wc -l)
curl -s "$url" | while IFS= read -r line; do
((++line_number))
sudo ufw deny out from any to $line
clear
echo "Iran IP Blocking ( List 3 ) : $line_number / $allcount "
done
ufw allow from any to any port $pport proto tcp
sudo ufw allow $pport
sudo ufw allow 80/tcp
sudo ufw allow 80/udp
sudo ufw allow 443/tcp
sudo ufw allow 443/udp
sudo ufw allow 7575/tcp
sudo ufw allow 14000/tcp
ufw enable
