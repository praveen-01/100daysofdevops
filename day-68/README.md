# Day-68: Setup Jenkins Server
---
# Task
The DevOps team at xFusionCorp Industries is initiating the setup of CI/CD pipelines and has decided to utilize Jenkins as their server. Execute the task according to the provided requirements:
1. Install Jenkins on the jenkins server using the yum utility only, and start its service.
If you face a timeout issue while starting the Jenkins service, refer to this.
2. Jenkin's admin user name should be theadmin, password should be Adm!n321, full name should be Mark and email should be mark@jenkins.stratos.xfusioncorp.com.
Note:
1. To access the jenkins server, connect from the jump host using the root user with the password S3curePass.
2. After Jenkins server installation, click the Jenkins button on the top bar to access the Jenkins UI and follow on-screen instructions to create an admin user.
---
# Solution
1. login to the jenkins server using the given credentials
2. install jenkins package using yum, we have to add the jenkins repo into yum artifacts before installing
```
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
```
3. check the status of jenkins service and restart the service
4. click on Jenkins button at the top to open UI
5. It prompts for a password, enter the password for Authentication by looking for it at the given place(it would be `/var/lib/jenkins/secrets/initialAdminPassword`)
6. Install default Plugins
7. Create Admin User by filling the details as given in the instructions
8. After finishing just cross-check by clicking on Jenkins button again