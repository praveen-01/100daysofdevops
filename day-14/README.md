# Day-14: Linux Process Troubleshooting
---

# Task
---
In datacenter we have apache server which is not running on one of the hosts which are connected from jumphost find the host where it is not running and make sure the service is up and running without any issues on port 8088

---

# Solution
- From jumphost run curl stapp01:8088 and so on for all the hosts which are connected to the jumphost(we can get the list from `cat /etc/hosts` on jumphost)
- All other hosts would return an webpage except for one host which would give `connection failed`
- login to the host and check for status of apache server using `systemctl status httpd.service`
- try to see if you could look at any errors as to why the service is failing to comeup(it is failing to come up hence the connection refused error)
- we should `address already in use` error messaege in the service logs
- check which other process is using the allocated address 8088 using `netstat -tulnp | grep 8088` (remeber to run this command in root as -p flag will only work in root)
- once identifed and once we get the pid which is running on port 8088 kill the process using `kill -9 <PID>`
- restart the httpd.service using `systemctl restart httpd.service`
- go to jumphost and try step-1 to make sure this host too returns the website and if it does we are good to go for today's project

---
## Commands which are used:
```
curl <host>:<port>
systemctl status httpd.service
netstat -tulnp | grep 8088 #to get the details of the connection on this port like pid of the process,status of the connection and address of the connection
systemctl restart httpd.service
```
