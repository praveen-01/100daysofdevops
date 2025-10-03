# Day 40 Docker EXEC Operations
---
# Task
One of the Nautilus DevOps team members was working to configure services on a kkloud container that is running on App Server 2 in Stratos Datacenter. Due to some personal work he is on PTO for the rest of the week, but we need to finish his pending work ASAP. Please complete the remaining work as per details given below:
a. Install apache2 in kkloud container using apt that is running on App Server 2 in Stratos Datacenter.
b. Configure Apache to listen on port 8084 instead of default http port. Do not bind it to listen on specific IP or hostname only, i.e it should listen on localhost, 127.0.0.1, container ip, etc.
c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.
---
# Solution
1. exec into container and then install the package using apt
2. change the port in ports.conf and in 000-default.conf 
3. start the apache2 process inside the process
```
[root@stapp02 ~]# docker ps
CONTAINER ID   IMAGE          COMMAND       CREATED              STATUS              PORTS     NAMES
afb146f17762   ubuntu:18.04   "/bin/bash"   About a minute ago   Up About a minute             kkloud
[root@stapp02 ~]# docker exec -it kkloud bash
root@afb146f17762:/# apt install apache2
root@afb146f17762:/etc/apache2# ls
apache2.conf    conf-enabled  magic           mods-enabled  sites-available
conf-available  envvars       mods-available  ports.conf    sites-enabled
root@afb146f17762:/etc/apache2# vi apache2.conf 
root@afb146f17762:/etc/apache2# vi ports.conf 
root@afb146f17762:/etc/apache2# cd sites-enabled/
root@afb146f17762:/etc/apache2/sites-enabled# ls
000-default.conf
root@afb146f17762:/etc/apache2/sites-enabled# vi 000-default.conf 
root@afb146f17762:/etc/apache2/sites-enabled# service apache2 restart
 * Restarting Apache httpd web server apache2                                                               
 AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.12.0.2. Set the 'ServerName' directive globally to suppress this message  [ OK ]
root@afb146f17762:/etc/apache2/sites-enabled# apachectl status
root@afb146f17762:/etc/apache2/sites-enabled# curl -sI http://127.0.0.1:8084/ | head -n1
HTTP/1.1 200 OK
root@afb146f17762:/etc/apache2/sites-enabled# 
```
