# Day-9 MariaDB Troubleshooting
---
# Task
There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that mariadb service is down on the database server.
Look into the issue and fix the same.

---
# Solution
1. check the status of mariadb.service on db host to findout why it was failing
2. if we dont have any pointers in the service status, check the log file in /var/log/mariadb/mariadb.log
3. fix the issues as mentioned could be permission issue to one of the dependent folder
4. in this case i saw this error 
```
2025-09-22 11:20:14 0 [ERROR] mariadbd: Can't create/write to file '/run/mariadb/mariadb.pid' (Errcode: 13 "Permission denied")
2025-09-22 11:20:14 0 [ERROR] Can't start server: can't create PID file: Permission denied
```
5. checked the permissions for `/run/mariadb` folder and changed then to mysql:mysql
