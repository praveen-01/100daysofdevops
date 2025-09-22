#!/bin/bash
yum install -y iptables iptables-services
systemctl start iptables && systemctl enable iptables
iptables -A INPUT -p tcp --destination-port 3004 -s 172.16.238.14 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 3004 -j DROP
iptables -R INPUT 5 -p icmp -j REJECT
service iptables save
systemctl restart iptables && systemctl status iptables