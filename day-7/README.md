# Day-7 Linux SSH Authentication
---
# Task
The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. To make these scripts work properly we need to make sure the thor user on jump host has password-less SSH access to all app servers through their respective sudo users (i.e tony for app server 1). Based on the requirements, perform the following:
Set up a password-less authentication from user thor on jump host to all app servers through their respective sudo users.

---
# Solution
1. create a ssh key for thor user on jumpbox
2. copy the public key of thor to `.ssh/authorized_keys` on other app servers
3. this makes sure that we can login to any server without any password for the sudo user from thor user

## commands used:
```
thor@jumphost ~/.ssh$ ssh-keygen
[banner@stapp03 ~]$ mkdir .ssh
[banner@stapp03 ~]$ vi .ssh/authorized_keys
[banner@stapp03 ~]$ 
thor@jumphost ~/.ssh$ ssh banner@stapp03
Last login: Mon Sep 22 10:55:01 2025 from 172.16.238.3
[banner@stapp03 ~]$ 
logout
Connection to stapp03 closed.
thor@jumphost ~/.ssh$ 
```
