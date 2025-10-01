# Day 38 Pull Docker Image
---
# Task
Nautilus project developers are planning to start testing on a new project. As per their meeting with the DevOps team, they want to test containerized environment application features. As per details shared with DevOps team, we need to accomplish the following task:
a. Pull busybox:musl image on App Server 2 in Stratos DC and re-tag (create new tag) this image as busybox:media.
---
# Solution
1. pull the image and tag the image with the given name
```
[steve@stapp02 ~]$ docker pull busybox:musl
musl: Pulling from library/busybox
8e7bef4a92af: Pull complete 
Digest: sha256:254e6134b1bf813b34e920bc4235864a54079057d51ae6db9a4f2328f261c2ad
Status: Downloaded newer image for busybox:musl
docker.io/library/busybox:musl
[steve@stapp02 ~]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      musl      44f1048931f5   12 months ago   1.46MB
[steve@stapp02 ~]$ docker image tag 44f1048931f5 busybox:media
[steve@stapp02 ~]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      media     44f1048931f5   12 months ago   1.46MB
busybox      musl      44f1048931f5   12 months ago   1.46MB
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
```