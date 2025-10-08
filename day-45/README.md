# Day 45 Resolve Dockerfile Issues
---
# Task
The Nautilus DevOps team is working to create new images per requirements shared by the development team. One of the team members is working to create a Dockerfile on App Server 3 in Stratos DC. While working on it she ran into issues in which the docker build is failing and displaying errors. Look into the issue and fix it to build an image as per details mentioned below:
a. The Dockerfile is placed on App Server 3 under /opt/docker directory.
b. Fix the issues with this file and make sure it is able to build the image.
c. Do not change base image, any other valid configuration within Dockerfile, or any of the data been used — for example, index.html.
Note: Please note that once you click on FINISH button all the existing containers will be destroyed and new image will be built from your Dockerfile.
---
# Solution
1. try building the image with the given dockerfile
2. I observed that it was failing with path not found error
3. fixed the path in the Dockerfile and voila it works
```
 => ERROR [2/8] RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf.d/httpd.conf  1.0s
------                                                                                            
 > [2/8] RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf.d/httpd.conf:
1.008 sed: can't read /usr/local/apache2/conf.d/httpd.conf: No such file or directory
------
Dockerfile:3
--------------------
   1 |     FROM httpd:2.4.43
   2 |     
   3 | >>> RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf.d/httpd.conf
   4 |     
   5 |     RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf.d/httpd.conf
--------------------
ERROR: failed to build: failed to solve: process "/bin/sh -c sed -i \"s/Listen 80/Listen 8080/g\" /usr/local/apache2/conf.d/httpd.conf" did not complete successfully: exit code: 2
[root@stapp03 docker]# cat Dockerfile 
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt

COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
[root@stapp03 docker]# 
[root@stapp03 docker]# docker build .
[+] Building 38.8s (13/13) FINISHED                                                docker:default
```