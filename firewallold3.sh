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
