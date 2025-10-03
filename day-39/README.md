# Day 39 Create Image from Container
---
# Task
One of the Nautilus developer was working to test new changes on a container. He wants to keep a backup of his changes to the container. A new request has been raised for the DevOps team to create a new image from this container. Below are more details about it:
a. Create an image media:xfusion on Application Server 1 from a container ubuntu_latest that is running on same server.
---
# Solution
1. use docker commit to take a snapshot of the container and convert that to an image
```
[root@stapp01 ~]# docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
f5a9a0a2035d   ubuntu    "/bin/bash"   42 seconds ago   Up 41 seconds             ubuntu_latest
[root@stapp01 ~]# docker commit f5a9a0a2035d news:nautilus
sha256:5a1850d983c59cd9df20a4eda7340deebcd6c3b679a1ea9c5c3585eba799b7f4
[root@stapp01 ~]# docker images
REPOSITORY   TAG        IMAGE ID       CREATED         SIZE
news         nautilus   5a1850d983c5   4 seconds ago   133MB
ubuntu       latest     ce8f79aecc43   2 days ago      78.1MB
[root@stapp01 ~]# 

```
