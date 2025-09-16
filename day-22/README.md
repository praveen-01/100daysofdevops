# day-22: clone git repo
---

# Task
We have a repo in storage server in DC which the devops team want to clone

---

# solution
1. use `git clone` to clone the repo 
```
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ git clone /opt/cluster.git/
Cloning into 'cluster'...
warning: You appear to have cloned an empty repository.
done.
[natasha@ststor01 kodekloudrepos]$ 
[natasha@ststor01 kodekloudrepos]$ ls -ltrh
total 4.0K
drwxr-xr-x 3 natasha natasha 4.0K Sep 16 04:45 cluster
```
