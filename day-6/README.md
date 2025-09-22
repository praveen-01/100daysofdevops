# Day-6 Create a Cron Job
---
# Task
The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:
a. Install cronie package on all Nautilus app servers and start crond service.
b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

---
# Solution
1. install the package cronie on all servers
2. start the crond service and check the status of crond service status
3. edit crontab in root and add the cronjob
4. after adding you can list the jobs and see if it was added successfully 
5. wait for 5 mins and make sure /tmp/cron_text was created
6. do this on all app servers

## commands used:
```
yum install -y cronie
systemctl status crond
systemctl start crond
[root@stapp01 ~]# crontab -e
no crontab for root - using an empty one
crontab: installing new crontab
[root@stapp01 ~]# crontab -l
*/5 * * * * echo hello > /tmp/cron_text
[root@stapp01 tmp]# ls -ltrh | grep cron
-rw-r--r-- 1 root root    6 Sep 22 10:45 cron_text
[root@stapp01 tmp]# 
```

