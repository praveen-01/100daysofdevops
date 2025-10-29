# day-51 Execute Rolling Updates in Kubernetes
---
# Task
An application currently running on the Kubernetes cluster employs the nginx web server. The Nautilus application development team has introduced some recent changes that need deployment. They've crafted an image nginx:1.18 with the latest updates.
Execute a rolling update for this application, integrating the nginx:1.18 image. The deployment is named nginx-deployment.
Ensure all pods are operational post-update.
Note: The kubectl utility on jump_host is set up to operate with the Kubernetes cluster
---
# Solution
1. we have to edit the deployment to change the version of the container image from 1.16 to 1.18
2. go over this block for more details/info https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment
```
thor@jumphost ~$ kubectl edit deployment nginx-deployment
deployment.apps/nginx-deployment edited
thor@jumphost ~$ kubectl rollout status nginx-deployment
error: the server doesn't have a resource type "nginx-deployment"
thor@jumphost ~$ kubectl rollout status deployment/nginx-deployment
deployment "nginx-deployment" successfully rolled out
thor@jumphost ~$ kubectl get po -A | grep nginx
default              nginx-deployment-58cf54c7f6-ts8cc                 1/1     Running   0          38s
default              nginx-deployment-58cf54c7f6-x25rr                 1/1     Running   0          28s
default              nginx-deployment-58cf54c7f6-zs5hc                 1/1     Running   0          30s
thor@jumphost ~$ 
```
