# Day 57: Print Environment Variables
---
# Task
The Nautilus DevOps team is working on to setup some pre-requisites for an application that will send the greetings to different users. There is a sample deployment, that needs to be tested. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about it.

Create a pod named print-envars-greeting.

Configure spec as, the container name should be print-env-container and use bash image.

Create three environment variables:

a. GREETING and its value should be Welcome to

b. COMPANY and its value should be Stratos

c. GROUP and its value should be Industries

Use command ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"'] (please use this exact command), also set its restartPolicy policy to Never to avoid crash loop back.

You can check the output using kubectl logs -f print-envars-greeting command.
---
# Solution
```
thor@jumphost ~$ vi pod.yaml
thor@jumphost ~$ kubectl apply -f pod.yaml 
pod/print-envars-greeting created
thor@jumphost ~$ kubectl get po
NAMESPACE            NAME                                              READY   STATUS      RESTARTS   AGE
default              print-envars-greeting                             0/1     Completed   0          4s
thor@jumphost ~$ kubectl logs -f print-envars-greeting print-env-container 
Welcome to Stratos Industries
thor@jumphost ~$ 
```