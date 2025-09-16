# day-21: Install and configure Git storage server
---
# Task
The Nautilus development team has provided requirements to the DevOps team for a new application development project, specifically requesting the establishment of a Git repository. Follow the instructions below to create the Git repository on the Storage server in the Stratos DC:

Utilize yum to install the git package on the Storage Server.
Create a bare repository named /opt/demo.git (ensure exact name usage).

---
# Solution
1. Install the git package
```
yum install -y git
```
2. create the repo
```
git init --bare /opt/demo.git
```
---

# Readings
 What is a bare repo? 
 
 https://www.geeksforgeeks.org/git/bare-repositories-in-git/
 https://stegosaurusdormant.com/bare-git-repo/#fn:different-storage