# Day-5 SElinux Installation and Configuration
---
# Task
Following a security audit, the xFusionCorp Industries security team has opted to enhance application and server security with SELinux. To initiate testing, the following requirements have been established for App server 1 in the Stratos Datacenter:
Install the required SELinux packages.
Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.
No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.
Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.

---
# Solution
1. install selinux on app server 1 using yum package manager
2. change the config from file `/etc/selinux/config` of `SELinux` from enabling to disabled

## commands used:
```
yum install -y libselinux libselinux-utils policycoreutils policycoreutils-python-utils selinux-policy selinux-policy-targeted
```

## Learnings:
https://www.linode.com/docs/guides/a-beginners-guide-to-selinux-on-centos-7/
