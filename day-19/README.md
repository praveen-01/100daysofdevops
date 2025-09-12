# day-19: Install and configure Web application
---

# Task

xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in-progress, but we want to get the servers ready. Please perform the following steps to accomplish the task:

a. Install httpd package and dependencies on app server 1.
b. Apache should serve on port 8088.
c. There are two website's backups /home/thor/media and /home/thor/apps on jump_host. Set them up on Apache in a way that media should work on the link http://localhost:8088/media/ and apps should work on link http://localhost:8088/apps/ on the mentioned app server.
d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:8088/media/ and curl http://localhost:8088/apps/

---

# Solution
- install httpd on the app server1 using `yum install -y httpd`
- change the listen port in httpd conf so that the server can run on different port
```
    - vi /etc/httpd/conf/httpd.conf
    - change Listen 80 to Listern 8088
    - save and exit
```
- copy the media and apps index files from jumphost to app server 
- move the copied files to `/var/www/html/media` and `/var/www/html/apps`
- start the httpd service
```
[root@stapp01 apps]# systemctl enable httpd.service
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
[root@stapp01 apps]# systemctl start httpd.service
[root@stapp01 apps]# 
[root@stapp01 apps]# systemctl status httpd.service
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
     Active: active (running) since Fri 2025-09-12 05:41:58 UTC; 7s ago
       Docs: man:httpd.service(8)
   Main PID: 2951 (httpd)
     Status: "Started, listening on: port 8088"
```
- run curl commands as given in the task to verify that websites are configured correctly indeed
```
[root@stapp01 apps]# curl http://localhost:8088/media/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our media website</p>

</body>
</html>[root@stapp01 apps]# 
[root@stapp01 apps]# curl http://localhost:8088/apps/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our apps website</p>

</body>
</html>[root@stapp01 apps]# 
```