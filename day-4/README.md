# Day-4 Script Execution Permissions
---
# Task
In a bid to automate backup processes, the xFusionCorp Industries sysadmin team has developed a new bash script named xfusioncorp.sh. While the script has been distributed to all necessary servers, it lacks executable permissions on App Server 1 within the Stratos Datacenter.
Your task is to grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 1. Additionally, ensure that all users have the capability to execute it.


---
# Solution
1. very straight forward, we have to add execute permissions to the `xfusioncorp.sh` in `/tmp`
2. the only thing that we need in our back of mind is for any user to execute the script he also needs read permissions
3. so give read and execute for all users,groups

## commands used:
```
[tony@stapp01 tmp]$ ls -ltrh | grep .sh
---------- 1 root root   40 Sep 22 10:22 xfusioncorp.sh
[tony@stapp01 tmp]$ sudo chmod +rx xfusioncorp.sh 
[tony@stapp01 tmp]$ ls -ltrh | grep .sh
-r-xr-xr-x 1 root root   40 Sep 22 10:22 xfusioncorp.sh
[tony@stapp01 tmp]$ 
```

## Learnings:
to change the permissions of a file we use `chmod` and `+` for adding permissions and `-` for removing permissions 
```
x -> execute
r -> read
w -> write
also u-> user
    g -> group
    o -> others
so o+rw mean add read and write permissions for other users
``` 
we need read permissions also to execute a file along with execute permissions
