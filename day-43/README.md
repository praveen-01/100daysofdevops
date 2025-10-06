# Day 43 Docker Ports Mapping
---
# Task
The Nautilus DevOps team is planning to host an application on a nginx-based container. There are number of tickets already been created for similar tasks. One of the tickets has been assigned to set up a nginx container on Application Server 3 in Stratos Datacenter. Please perform the task as per details mentioned below:
a. Pull nginx:alpine docker image on Application Server 3.
b. Create a container named apps using the image you pulled.
c. Map host port 3001 to container port 80. Please keep the container in running state.
---
# Solution
```
[root@stapp03 ~]# docker pull nginx:alpine
[root@stapp03 ~]# docker run -p 3001:80 -d --name apps nginx:alpine
13d28f162cafdc9ad5bb4a1304d0e2587f7eef1e9b8ffb00261f630d440b18bb
[root@stapp03 ~]# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
13d28f162caf   nginx:alpine   "/docker-entrypoint.…"   3 seconds ago   Up 2 seconds   0.0.0.0:3001->80/tcp   apps
[root@stapp03 ~]# 
```
