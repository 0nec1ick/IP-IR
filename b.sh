#!/bin/bash
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/shervin.txt); do sudo ipset add shervin $x; done
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/MCI.txt); do sudo ipset add MCI $x; done
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/iranipv4.txt); do sudo ipset add iranipv4 $x; done
for x in $(curl https://raw.githubusercontent.com/0nec1ick/IP-IR/main/iranipv6.txt); do sudo ipset add iranipv6 $x; done
