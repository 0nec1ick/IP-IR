#!/bin/bash
sudo apt install curl -y
sudo apt install ipset -y
sudo apt install iptables-persistent -y
sudo iptables -F
sudo ipset destroy
sudo ipset create MCI hash:net
sudo ipset create iranipv4 hash:net
sudo ipset create iranipv6 hash:net family inet6
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/MCI.txt); do sudo ipset add MCI $x; done
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/iranipv4.txt); do sudo ipset add iranipv4 $x; done
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/iranipv6.txt); do sudo ipset add iranipv6 $x; done
sudo iptables -A INPUT -m set --match-set MCI src -j ACCEPT
sudo iptables -A OUTPUT -m set --match-set iranipv4 src -j DROP
sudo ip6tables -A OUTPUT -m set --match-set iranipv6 src -j DROP
sudo iptables -A INPUT -j DROP
sudo iptables-save > /etc/iptables/rules.v4
sudo iptables-save > /etc/iptables/rules.v6
sudo systemctl enable iptables
sudo systemctl start iptables
sudo systemctl is-enabled netfilter-persistent.service
clear 
echo "Success , Blocked Iran IP :)"
