# Day 41 Write a Docker File
---
# Task
As per recent requirements shared by the Nautilus application development team, they need custom images created for one of their projects. Several of the initial testing requirements are already been shared with DevOps team. Therefore, create a docker file /opt/docker/Dockerfile (please keep D capital of Dockerfile) on App server 3 in Stratos DC and configure to build an image with the following requirements:
a. Use ubuntu:24.04 as the base image.
b. Install apache2 and configure it to work on 5004 port. (do not update any other Apache configuration settings like document root etc).

---
# Solution
1. this is very similiar to yesterday's challenge we have write the instructions in a dockerfile is all
2. Use `FROM` to pull the base image and `RUN` to run any commands 
3. expose the mentioned ports in the task description
