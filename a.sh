#!/bin/bash
sudo apt-get install curl -y
sudo apt-get install ipset -y
sudo ipset create NOMCI hash:net
sudo ipset create iranipv4 hash:net
sudo ipset create iranipv6 hash:net family inet6
