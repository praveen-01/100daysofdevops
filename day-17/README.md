# day-17: Install and configure postgresql

---

# Task

The Nautilus application development team has shared that they are planning to deploy one newly developed application on Nautilus infra in Stratos DC. The application uses PostgreSQL database, so as a pre-requisite we need to set up PostgreSQL database server as per requirements shared below:
PostgreSQL database server is already installed on the Nautilus database server.
a. Create a database user kodekloud_tim and set its password to LQfKeWWxWD.
b. Create a database kodekloud_db5 and grant full permissions to user kodekloud_tim on this database.
Note: Please do not try to restart PostgreSQL server service.

---

# Solution
- if we know about database creation and users it is pretty straight forward if not please go over these resources to get this task done
    - https://www.postgresql.org/docs/8.0/sql-createuser.html 
    - https://www.postgresql.org/docs/current/sql-createdatabase.html
    - https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e

- after reading i tried the commands and it worked!

```
root@stdb01 postgresql-setup]# cd 
[root@stdb01 ~]# psql -U postgres
psql (13.14)
Type "help" for help.

postgres=# 
postgres=# select current_database();
 current_database 
------------------
 postgres
(1 row)
postgres=# create user kodekloud_tim with password 'LQfKeWWxWD';
CREATE ROLE
postgres=# 
postgres=# create database kodekloud_db5;
CREATE DATABASE
postgres=# 
postgres=# grant all privileges on database "kodekloud_db5" to kodekloud_tim;
GRANT
postgres=# 
postgres=# 
[root@stdb01 ~]# psql -U kodekloud_tim -d kodekloud_db5
Password for user kodekloud_tim: 
psql (13.14)
Type "help" for help.
kodekloud_db5=> \conninfo
You are connected to database "kodekloud_db5" as user "kodekloud_tim" via socket in "/var/run/postgresql" at port "5432".
kodekloud_db5=>
[root@stdb01 ~]# 
```