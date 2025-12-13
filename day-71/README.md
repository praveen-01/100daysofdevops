# Day-71: Automating Package Installations with Jenkins
---
# Task
Some new requirements have come up to install and configure some packages on the Nautilus infrastructure under Stratos Datacenter. The Nautilus DevOps team installed and configured a new Jenkins server so they wanted to create a Jenkins job to automate this task. Find below more details and complete the task accordingly:



1. Access the Jenkins UI by clicking on the Jenkins button in the top bar. Log in using the credentials: username admin and password Adm!n321.


2. Create a new Jenkins job named install-packages and configure it with the following specifications:


Add a string parameter named PACKAGE.
Configure the job to install a package specified in the $PACKAGE parameter on the storage server within the Stratos Datacenter.

---
# Solution
1. Login to the jenkins server using the given credentials
2. we need to install `Publish Over SSH` to achieve this task so go to `Manage Jenkins` -> `Plugins` and install the plugin
3. Once installed go `Manage Jenkins` -> `System` -> `Publish over SSH` and add ssh server at the bottom and test the connection using Test at the bottom
4. Go to jobs and create a job `install-package` -> `Configure`
5. Select `This project is parameterised` and give `PACKAGE` as the name
6. In build steps select publish over ssh and select ststor01
7. use the build.sh script to install the package in the remote server (ref: https://dev.to/wycliffealphus/100-days-of-devops-day-71-1092)
8. Save and trigger the build and see if they succeed