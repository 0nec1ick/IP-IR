#!/bin/bash
sudo iptables -A INPUT -m set --match-set shervin src -j ACCEPT
sudo iptables -A INPUT -m set --match-set MCI src -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 56777 -j DROP
sudo iptables -A OUTPUT -m set --match-set iranipv4 src -j DROP
sudo ip6tables -A OUTPUT -m set --match-set iranipv6 src -j DROP
