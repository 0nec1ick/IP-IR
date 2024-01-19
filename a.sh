#!/bin/bash
sudo ipset create NOMCI.txt hash:net
sudo ipset create iranipv4 hash:net
sudo ipset create iranipv6 hash:net family inet6
