# Day-13 IPtables Installation And Configuration
---
# Task
We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 3004 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:
1. Install iptables and all its dependencies on each app host.
2. Block incoming port 3004 on all apps for everyone except for LBR host.
---
# Solution
1. install the iptable using package manager
2. bring up the service and enable it so that it stays up even after reboot
3. add iptable rules to block taffic from 3004 port

check config.sh which has all the commands to install and block the port
we can copy and run the script as is it will take care of installation and blocking the port
