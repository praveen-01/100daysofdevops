# Day 42 Create a Docker Network
---
# Task
The Nautilus DevOps team needs to set up several docker environments for different applications. One of the team members has been assigned a ticket where he has been asked to create some docker networks to be used later. Complete the task based on the following ticket description:
a. Create a docker network named as media on App Server 2 in Stratos DC.
b. Configure it to use macvlan drivers.
c. Set it to use subnet 192.168.0.0/24 and iprange 192.168.0.0/24.
---
# Solution
1. we just have to create a network with given specs
2. It is difficult to remeber all the options for a command use docker --help to figure out which flags are required for the options that were required
```
[root@stapp02 ~]# docker network create -d macvlan --ip-range 192.168.0.0/24 --subnet 192.168.0.0/24 media
b20ec4a35cbeb33a481ba270c33082a1e6e6d2d73a5b5cbecdbab852914881d6
```
