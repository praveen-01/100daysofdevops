# Day-15: 
---

# Task
---
The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:

1. Install and configure nginx on App Server 3.
2. On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.
3. Create an index.html file with content Welcome! under Nginx document root.
4. For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.

# Solution
---
- went through this page https://ubuntu.com/tutorials/install-and-configure-nginx#5-activating-virtual-host-and-testing-results
- yum install -y nginx
- in /etc/nginx look for nginx.conf and uncomment the ssl part, added the conf in repo as nginx.conf, we have to add this part in nginx.conf on server if not present
- move the server crt and server key to the directories mentioned in the conf file
```
server {
        listen       443 ssl http2;
        listen       [::]:443 ssl http2;
        server_name  _;
        root         /usr/share/nginx/html;

        ssl_certificate "/etc/pki/CA/certs/nautilus.crt";
        ssl_certificate_key "/etc/pki/CA/private/nautilus.key";
        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout  10m;
        ssl_ciphers PROFILE=SYSTEM;
        ssl_prefer_server_ciphers on;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
```
- create a index.html in path /usr/share/nginx/html/index.html and add the html content as is in repo
- enable the service and start the nginx service
```
[root@stapp03 html]# systemctl enable nginx
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
[root@stapp03 html]# systemctl start nginx.service
```
- Check the status of nginx service to make sure it is up and running

```
root@stapp03 html]# systemctl status nginx.service
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: disabled)
     Active: active (running) since Mon 2025-09-08 03:48:44 UTC; 12s ago
    Process: 3075 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 3076 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 3083 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
   Main PID: 3090 (nginx)
      Tasks: 17 (limit: 411434)
     Memory: 16.9M
     CGroup: /docker/d8d50fbfb282528958aebdbeae3b50b24b306ef7fee964cfc7fff9cdc3304624/system.slice/nginx.service
             ├─3090 "nginx: master process /usr/sbin/nginx"
             ├─3091 "nginx: worker process"
             ├─3092 "nginx: worker process"
             ├─3093 "nginx: worker process"
             ├─3094 "nginx: worker process"
             ├─3095 "nginx: worker process"
             ├─3096 "nginx: worker process"
             ├─3097 "nginx: worker process"
             ├─3098 "nginx: worker process"
             ├─3099 "nginx: worker process"
             ├─3100 "nginx: worker process"
             ├─3101 "nginx: worker process"
             ├─3102 "nginx: worker process"
             ├─3103 "nginx: worker process"
             ├─3104 "nginx: worker process"
             ├─3105 "nginx: worker process"
             └─3106 "nginx: worker process"

Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[3083]: nginx.service: Executing: /usr/sbin/nginx
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Child 3083 belongs to nginx.service.
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Control process exited, code=exited, status=0/SUCCESS (success)
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Got final SIGCHLD for state start.
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: New main PID 3090 belongs to service, we are happy.
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Main PID loaded: 3090
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Changed start -> running
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Job 326 nginx.service/start finished, result=done
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: Started The nginx HTTP and reverse proxy server.
Sep 08 03:48:44 stapp03.stratos.xfusioncorp.com systemd[1]: nginx.service: Failed to send unit change signal for nginx.service: Connection reset by peer
[root@stapp03 html]# 
```
- go to jumphost and run curl command to make sure it is reachable and is up and healthy and is serving https as expected
```
thor@jumphost ~$ curl -Ik https://stapp03/
HTTP/2 200 
server: nginx/1.20.1
date: Mon, 08 Sep 2025 03:55:13 GMT
content-type: text/html
content-length: 114
last-modified: Mon, 08 Sep 2025 03:48:28 GMT
etag: "68be520c-72"
accept-ranges: bytes

thor@jumphost ~$ curl -k https://stapp03/
<!DOCTYPE html>
<html>
  <head>
    <title>Welcome Page</title>
  </head>
  <body>
    Welcome
  </body>
</html>

thor@jumphost ~$ 
```

