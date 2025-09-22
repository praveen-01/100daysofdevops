# Day-3 Temporary User Setup with Expiry
---
# Task
Following security audits, the xFusionCorp Industries security team has rolled out new protocols, including the restriction of direct root SSH login.
Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter

---
# Solution
1. go to `/etc/ssh/sshd_config` and change `PermitRootLogin` to `no` this will disable the root login
2. restart the sshd service `systemctl restart sshd`
```
#LoginGraceTime 2m
PermitRootLogin no
#StrictModes yes
#MaxAuthTries 6
#MaxSessions 10
[root@stapp03 ~]# vi /etc/ssh/sshd_config
[root@stapp03 ~]# 
[root@stapp03 ~]# 
[root@stapp03 ~]# systemctl restart sshd
```

## Learnings:
sshd_config holds the sshd_config on how to login and what are allowed and what are not, by repalcing the `PermitRootLogin` to `no` we are disabling the root login as asked in the question

