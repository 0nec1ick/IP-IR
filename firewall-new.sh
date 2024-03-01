#!/bin/bash

timedatectl set-timezone "Asia/Tehran"
clear
echo "Time Set Tehran Successfull"
sleep 5
clear
sudo apt update -y
sudo apt install ufw  -y
sudo apt install curl unzip perl libtext-csv-xs-perl libmoosex-types-netaddr-ip-perl iptables-persistent ipset -y 
echo "Install Successfull"
sleep 5
sudo wget -4 -O /root/i.txt https://raw.githubusercontent.com/0nec1ick/IP-IR/main/i.txt &
wait

iptables -F

ipset create shahaniran hash:net
ipset flush shahaniran
while read line; do ipset add shahaniran $line; done < /root/i.txt
#iptables -A OUTPUT -m set --match-set shahaniran src -j DROP
iptables -A OUTPUT -p tcp --dport 443 -m set --match-set shahaniran dst -j DROP
iptables -A OUTPUT -p tcp --dport 80 -m set --match-set shahaniran dst -j DROP
sudo iptables-save > /etc/iptables/rules.v4
sudo ip6tables-save > /etc/iptables/rules.v6
echo "IPTable Block Iran IP Successfull"
sleep 5

sudo wget -4 -O /etc/ufw/user.rules https://raw.githubusercontent.com/0nec1ick/IP-IR/main/user.rules &
wait

ufw enable
echo "UFW Block Iran IP Successfull"
sleep 5
clear
echo "Blocked Iran Ip Successfull :)"
sleep 5
reboot