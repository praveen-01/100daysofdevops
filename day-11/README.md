# Day-11 Temporary User Setup with Expiry
---
# Task
The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:
a. Install tomcat server on App Server 1.
b. Configure it to run on port 6200.
c. There is a ROOT.war file on Jump host at location /tmp.
Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e curl http://stapp01:6200
---
# Solution
1. install the `tomcat` package on server1
2. change the port 8080 from the tomcat conf in path `/etc/tomcat/server.xml` to port 6200
3. copy the `ROOT.war` from jumphost to stapp01 and place that in `/usr/share/tomcat/webapps/`
4. enable and start the systemctl service
5. make sure curl is working from jumphost

