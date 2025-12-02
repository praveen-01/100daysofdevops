# Day 59: Troubleshoot Deployment issues in Kubernetes
---
# Task
Last week, the Nautilus DevOps team deployed a redis app on Kubernetes cluster, which was working fine so far. This morning one of the team members was making some changes in this existing setup, but he made some mistakes and the app went down. We need to fix this as soon as possible. Please take a look.
The deployment name is redis-deployment. The pods are not in running state right now, so please look into the issue and fix the same.
---
# Solution
1. Check the status of pods running in redis deployment using `kubectl get po`
2. describe events of the deployment to see why they are not in running state
3. by looking at the events there was an error with `'redis-conig' not found failed to mount volume name 'config'`
4. edit the deployment to fix the typo and now repeat 1 and 2
5. found that image name is also incorrect with an typo in tag
6. edit the deployment again and fix the typo and check the status of pods and they should be running
