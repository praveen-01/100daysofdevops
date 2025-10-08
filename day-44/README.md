# Day 44 Write a Docker Compose File
---
# Task
The Nautilus application development team shared static website content that needs to be hosted on the httpd web server using a containerised platform. The team has shared details with the DevOps team, and we need to set up an environment according to those guidelines. Below are the details:

a. On App Server 2 in Stratos DC create a container named httpd using a docker compose file /opt/docker/docker-compose.yml (please use the exact name for file).
b. Use httpd (preferably latest tag) image for container and make sure container is named as httpd; you can use any name for service.
c. Map 80 number port of container with port 3001 of docker host.
d. Map container's /usr/local/apache2/htdocs volume with /opt/finance volume of docker host which is already there. (please do not modify any data within these locations).
---
# Solution
1. write the docker-compose as added in this folder with `container_name`, `ports`,`volumes` parameters
2. `docker compose up -d` to bring up the container
3. make sure the container is named `httpd` and we can reach the port 3001 on host after the container is up and running
```
[root@stapp02 docker]# docker ps
CONTAINER ID   IMAGE          COMMAND              CREATED         STATUS         PORTS                  NAMES
1935f36ea96e   httpd:latest   "httpd-foreground"   4 seconds ago   Up 2 seconds   0.0.0.0:3001->80/tcp   httpd
[root@stapp02 docker]# 
```
