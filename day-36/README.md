# Day 36 Deploy Nginx Container on Application Server
---
# Task
The Nautilus DevOps team is conducting application deployment tests on selected application servers. They require a nginx container deployment on Application Server 1. Complete the task with the following instructions:
On Application Server 1 create a container named nginx_1 using the nginx image with the alpine tag. Ensure container is in a running state.
---
# Solution

```
[root@stapp01 ~]# docker run -d --name nginx_1 -p 80:80 nginx:alpine
22a264a578fcd297035f750912a75607b63984c95ec68b58314bb896086e6189
[root@stapp01 ~]# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                NAMES
22a264a578fc   nginx:alpine   "/docker-entrypoint.…"   3 seconds ago   Up 2 seconds   0.0.0.0:80->80/tcp   nginx_1
```