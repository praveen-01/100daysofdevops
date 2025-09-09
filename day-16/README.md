# Day-16
---

# Task
Day by day traffic is increasing on one of the websites managed by the Nautilus production support team. Therefore, the team has observed a degradation in website performance. Following discussions about this issue, the team has decided to deploy this application on a high availability stack i.e on Nautilus infra in Stratos DC. They started the migration last month and it is almost done, as only the LBR server configuration is pending. Configure LBR server as per the information given below:
a. Install nginx on LBR (load balancer) server.
b. Configure load-balancing with the an http context making use of all App Servers. Ensure that you update only the main Nginx configuration file located at /etc/nginx/nginx.conf.
c. Make sure you do not update the apache port that is already defined in the apache configuration on all app servers, also make sure apache service is up and running on all app servers.
d. Once done, you can access the website using StaticApp button on the top bar.

---

# Solution
- install nginx on lb using `yum install -y nginx`
- we need to get the port where apache server is running so go to any one application server and then check for apache port it should be present in `/etc/httpd/conf/httpd.conf`
- on load balancer node edit the config file at `/etc/nginx/nginx.conf` to include the upstream block and also the proxy_pass block
```
http {
    upstream backend {
        server stapp01:5000;
        server stapp02:5000;
        server stapp03:5000;
    }
    server {
        location / {
        proxy_pass http://backend;
        }
    }
}
```
- once added enable and start the nginx service
- we are good to go!
