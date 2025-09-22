# Day-12 Linux Network Services
---
# Task
Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, as its Apache service is not reachable on port 3003 (which is the Apache port). The service itself could be down, the firewall could be at fault, or something else could be causing the issue.
Use tools like telnet, netstat, etc. to find and fix the issue. Also make sure Apache is reachable from the jump host without compromising any security settings.
Once fixed, you can test the same using command curl http://stapp01:3003 command from jump host.
Note: Please do not try to alter the existing index.html code, as it will lead to task failure.
---
# Solution
1. check the status of httpd.service status and fix any issues which might cause issues for that to run successfully
2. in my case mail service was running on same port 3003
3. killed the mail service and restarted the httpd.service 
4. check the curl command and we should be good
5. if not then firewall on stapp01 is blocking specifically on stapp01 check the iptables and allow port 3003 as like in 5 from the below output wher it is rejecting all traffic except the ones above
```
[root@stapp01 ~]# iptables -L -n -v --line-numbers 
Chain INPUT (policy ACCEPT 0 packets, 0 bytes) 
num pkts bytes target prot opt in out source destination 
1 1157 280K ACCEPT all -- * * 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED 
2 0 0 ACCEPT icmp -- * * 0.0.0.0/0 0.0.0.0/0 
3 3 191 ACCEPT all -- lo * 0.0.0.0/0 0.0.0.0/0 
4 1 60 ACCEPT tcp -- * * 0.0.0.0/0 0.0.0.0/0 state NEW tcp dpt:22 
5 17 1020 REJECT all -- * * 0.0.0.0/0 0.0.0.0/0 reject-with icmp-host-prohibited 
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes) 
num pkts bytes target prot opt in out source destination 
1 0 0 REJECT all -- * * 0.0.0.0/0 0.0.0.0/0 reject-with icmp-host-prohibited 
Chain OUTPUT (policy ACCEPT 745 packets, 485K bytes) 
num pkts bytes target prot opt in out source destination 
# Warning: iptables-legacy tables present, use iptables-legacy to see them 
[root@stapp01 ~]#
```

## commands used:
```

sudo iptables -I INPUT 5 -p tcp --dport 3003 -j ACCEPT
```

## Learnings:
