# Day 37 Copy File to Docker Container
---
# Task
The Nautilus DevOps team possesses confidential data on App Server 3 in the Stratos Datacenter. A container named ubuntu_latest is running on the same server.
Copy an encrypted file /tmp/nautilus.txt.gpg from the docker host to the ubuntu_latest container located at /home/. Ensure the file is not modified during this operation.
---
# Solution

1. docker cp is used to copy the file from host path into container

```
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
fa7e0eb1b8c6   ubuntu    "/bin/bash"   About a minute ago   Up About a minute             ubuntu_latest
[banner@stapp03 ~]$ docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/home/
Successfully copied 2.05kB to ubuntu_latest:/home/
[banner@stapp03 ~]$ 
```