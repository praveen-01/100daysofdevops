# Day-1
---

# Task
To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell. Here's your task:
Create a user named kareem with a non-interactive shell on App Server 2.
Note: You can find the infrastructure details by clicking on the Details of all Users and Servers button on the top-right section of the page.

---
# Solution

To create a Linux user with a non-interactive shell, use the useradd or adduser command with the -s flag to specify a non-interactive shell such as /sbin/nologin or /bin/false.
For example, to create a user named yousuf with a non-interactive shell, run sudo useradd -s /sbin/nologin yousuf.
The /sbin/nologin shell displays a message stating the account is not available upon login attempt, while /bin/false exits immediately without a message

## commands used:
```
adduser kareem -s /sbin/nologin
cat /etc/passwd | grep kareem #to check if kareem is added and if the usershell looks like /sbin/nologin
```