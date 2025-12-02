# day 52 Revert Deployment to Previous Version in Kubernetes
---
# Task

---
# Solution
```
thor@jumphost ~$ kubectl rollout history deployment/nginx-deployment
deployment.apps/nginx-deployment 
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl set image deployment nginx-deployment nginx-container=nginx:alpine --kubeconfig=/root/.kube/config --record=true

thor@jumphost ~$ 
thor@jumphost ~$ kubectl rollout undo deployment/nginx-deployment
deployment.apps/nginx-deployment rolled back
thor@jumphost ~$ 
thor@jumphost ~$ kubectl get po -A
NAMESPACE            NAME                                              READY   STATUS              RESTARTS   AGE
default              nginx-deployment-698959d995-k5lmk                 1/1     Running             0          7m40s
default              nginx-deployment-989f57c54-j92vc                  0/1     ContainerCreating   0          1s
default              nginx-deployment-989f57c54-jztm9                  1/1     Running             0          3s
default              nginx-deployment-989f57c54-s8b7v                  1/1     Running        
```