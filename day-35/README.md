# Day 35 
---
# Task
The Nautilus DevOps team aims to containerize various applications following a recent meeting with the application development team. They intend to conduct testing with the following steps:
Install docker-ce and docker compose packages on App Server 3.
Initiate the docker service.
---
# Solution
1. Install the packages and start the docker.service
```
[root@stapp03 ~]# yum config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo   
Adding repo from: https://download.docker.com/linux/centos/docker-ce.repo
[root@stapp03 ~]# yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
[root@stapp03 ~]# systemctl enable docker
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
[root@stapp03 ~]# systemctl start docker
```
