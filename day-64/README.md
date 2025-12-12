# Day-64: Fix Python App Deployed on Kubernetes Cluster
---
# Task
One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster. Unfortunately, due to some mis-configuration, the application is not coming up. Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.
The deployment name is python-deployment-datacenter, its using poroko/flask-demo-appimage. The deployment and service of this app is already deployed.
nodePort should be 32345 and targetPort should be python flask app's default port.
---
# Solution
1. edit the python-deployment manifst and change the container name ass there is a typo, once the typo is fixed the pod should be running after that
2. edit the svc also to fix the targetport to `5000` from `8080`
3. once these edits are saved check the app and it should be up and running

```
thor@jumphost ~$ kubectl get po 
NAME                                            READY   STATUS             RESTARTS   AGE
python-deployment-datacenter-6fdb496d59-2dlbn   0/1     ImagePullBackOff   0          84s
thor@jumphost ~$ kubectl edit deployment python-deployment-datacenter 
deployment.apps/python-deployment-datacenter edited
thor@jumphost ~$ kubectl get po
NAME                                            READY   STATUS    RESTARTS   AGE
python-deployment-datacenter-76b8f5c96c-qwrb2   1/1     Running   0          40s
thor@jumphost ~$ kubectl get svc
NAME                        TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes                  ClusterIP   10.96.0.1      <none>        443/TCP          18m
python-service-datacenter   NodePort    10.96.247.63   <none>        8080:32345/TCP   6m24s
thor@jumphost ~$ kubectl edit svc python-service-datacenter 
service/python-service-datacenter edited
thor@jumphost ~$ kubectl get svc
NAME                        TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes                  ClusterIP   10.96.0.1      <none>        443/TCP          23m
python-service-datacenter   NodePort    10.96.247.63   <none>        5000:32345/TCP   11m
thor@jumphost ~$ 
```