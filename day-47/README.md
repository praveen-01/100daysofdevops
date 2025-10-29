# Day 47 Docker Python App
---
# Task
A python app needed to be Dockerized, and then it needs to be deployed on App Server 2. We have already copied a requirements.txt file (having the app dependencies) under /python_app/src/ directory on App Server 2. Further complete this task as per details mentioned below:
Create a Dockerfile under /python_app directory:
Use any python image as the base image.
Install the dependencies using requirements.txt file.
Expose the port 5003.
Run the server.py script using CMD.
Build an image named nautilus/python-app using this Dockerfile.
Once image is built, create a container named pythonapp_nautilus:
Map port 5003 of the container to the host port 8098.
Once deployed, you can test the app using curl command on App Server 2.
---
# Solution
1. create the docker file by following the instructions use commands like copy to copy the files to image and run to run the commands
2. use docker run to start the container and give appropriate flags to run the container in the background
`[root@stapp02 python_app]# docker run -d --name pythonapp_nautilus -p 8098:5003 nautilus/python-app`

