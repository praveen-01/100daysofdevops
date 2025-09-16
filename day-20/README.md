# Day-20: 
---
# Task

The Nautilus application development team is planning to launch a new PHP-based application, which they want to deploy on Nautilus infra in Stratos DC. The development team had a meeting with the production support team and they have shared some requirements regarding the infrastructure. Below are the requirements they shared:
a. Install nginx on app server 3 , configure it to use port 8093 and its document root should be /var/www/html.
b. Install php-fpm version 8.2 on app server 3, it must use the unix socket /var/run/php-fpm/default.sock (create the parent directories if don't exist).
c. Configure php-fpm and nginx to work together.
d. Once configured correctly, you can test the website using curl http://stapp03:8093/index.php command from jump host.
NOTE: We have copied two files, index.php and info.php, under /var/www/html as part of the PHP-based application setup. Please do not modify these files.

---

# Solution
1. Install Nginx on stapp03
```
sudo yum install -y nginx
systemctl enable nginx
```
2. followed this discussion https://kodekloud.com/community/t/day-20-configure-nginx-php-fpm-using-unix-sock/482529/7