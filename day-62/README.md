# Day 62: Manage Secrets in Kubernetes
---
# Task
The Nautilus DevOps team is working to deploy some tools in Kubernetes cluster. Some of the tools are licence based so that licence information needs to be stored securely within Kubernetes cluster. Therefore, the team wants to utilize Kubernetes secrets to store those secrets. Below you can find more details about the requirements:
We already have a secret key file beta.txt under /opt location on jump host. Create a generic secret named beta, it should contain the password/license-number present in beta.txt file.
Also create a pod named secret-nautilus.
Configure pod's spec as container name should be secret-container-nautilus, image should be fedora with latest tag (remember to mention the tag with image). Use sleep command for container so that it remains in running state. Consume the created secret and mount it under /opt/apps within the container.
To verify you can exec into the container secret-container-nautilus, to check the secret key under the mounted path /opt/apps. Before hitting the Check button please make sure pod/pods are in running state, also validation can take some time to complete so keep patience.
---
```
thor@jumphost ~$ kubectl apply -f pod.yaml 
pod/secret-nautilus created
thor@jumphost ~$
thor@jumphost ~$ kubectl get po
NAME              READY   STATUS    RESTARTS   AGE
secret-nautilus   1/1     Running   0          4s
thor@jumphost ~$ kubectl exec -it secret-nautilus -- sh
sh-5.3# 
sh-5.3# cd /opt/apps
sh-5.3# ls
password
sh-5.3# cat password 
5ecur3
sh-5.3# 
```
