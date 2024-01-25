#!/bin/bash
url="https://raw.githubusercontent.com/0nec1ick/IP-IR/main/ipinput.txt"
allcount=$(curl -s "$url" | wc -l)
curl -s "$url" | while IFS= read -r line; do
((++line_number))
sudo ufw deny in from any to $line
clear
echo "Iran IP Blocking Input : $line_number / $allcount "
done
ufw enable
