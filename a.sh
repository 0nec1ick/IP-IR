#!/bin/bash
sudo ipset create shervin hash:net
sudo ipset create MCI hash:net
sudo ipset create iranipv4 hash:net
sudo ipset create iranipv6 hash:net family inet6
