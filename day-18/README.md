# day-18: Configure LAMP server
---

# Task
xFusionCorp Industries is planning to host a WordPress website on their infra in Stratos Datacenter. They have already done infrastructure configuration—for example, on the storage server they already have a shared directory /vaw/www/html that is mounted on each app host under /var/www/html directory. Please perform the following steps to accomplish the task:
a. Install httpd, php and its dependencies on all app hosts.
b. Apache should serve on port 5003 within the apps.
c. Install/Configure MariaDB server on DB Server.
d. Create a database named kodekloud_db1 and create a database user named kodekloud_pop identified as password ksH85UJjhb. Further make sure this newly created user is able to perform all operation on the database you created.
e. Finally you should be able to access the website on LBR link, by clicking on the App button on the top bar. You should see a message like App is able to connect to the database using user kodekloud_pop

---
# Solution
- resources used as ref:
    - https://mariadb.com/resources/blog/installing-mariadb-10-on-centos-7-rhel-7/
    - https://mariadb.com/docs/server/reference/sql-statements/data-definition/create/create-database
    - https://mariadb.com/docs/server/reference/sql-statements/account-management-sql-statements/create-user
    - https://stackoverflow.com/questions/5016505/mysql-grant-all-privileges-on-database
- install httpd and php
```
yum install -y httpd php
sudo yum install -y php-mysqlnd php-pdo php-gd php-xml php-mbstring
```
- go to /etc/httpd/conf/httpd.conf and update the Listen port from 80 to 5003
- enable and start the systemd service on all app hosts
- try the app link at the top to make sure the service is up and running we should see `App is not able to connect to db` but we should see that message if not we have to check if httpd service is up and running on all 3 app servers and is on port mentioned in the task(could be diffferent port so please check the task for httpd port)
- On db host install mariadb server
```
yum install mariadb-server
```
- start the service
```
[root@stdb01 ~]# systemctl start mariadb.service
```
- login into mariadb as root
```
[root@stdb01 ~]# mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 10.5.27-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```
- create user,database and grant all permission to the user
```
MariaDB [(none)]> create database kodekloud_db1;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> 
MariaDB [(none)]> 
MariaDB [(none)]> 
MariaDB [(none)]> create user kodekloud_pop identified by 'ksH85UJjhb';
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> 
MariaDB [(none)]> GRANT ALL ON kodekloud_db1 TO kodekloud_pop;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> 
MariaDB [(none)]> GRANT ALL ON kodekloud_db1.* TO kodekloud_pop;
Query OK, 0 rows affected (0.001 sec)
```
- now try the app link again and it should show `App is able to connect to the database using user kodekloud_pop` if yes then we are good with the task, if not make sure the db server is up and running and we can login to the `kodekloud_pop` using user we created earlier