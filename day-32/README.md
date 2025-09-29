# Day 32  
---
# Task
The Nautilus application development team has been working on a project repository /opt/ecommerce.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:
One of the developers is working on feature branch and their work is still in progress, however there are some changes which have been pushed into the master branch, the developer now wants to rebase the feature branch with the master branch without loosing any data from the feature branch, also they don't want to add any merge commit by simply merging the master branch into the feature branch. Accomplish this task as per requirements mentioned.
Also remember to push your changes once done.
---
# Solution
1. use git rebase command to rebase the feature branch to latest master
```
[root@ststor01 ecommerce]# git log
commit 0ea32a368e3117bb7fa2ddabe65ed743c65f332a (HEAD -> feature, origin/feature)
Author: Admin <admin@kodekloud.com>
Date:   Mon Sep 29 03:07:24 2025 +0000

    Add new feature

commit 553eef76fc9e443519a641b8354e1c74f90b4f26
Author: Admin <admin@kodekloud.com>
Date:   Mon Sep 29 03:07:24 2025 +0000

    initial commit
[root@ststor01 ecommerce]# git rebase master
Successfully rebased and updated refs/heads/feature.
[root@ststor01 ecommerce]# 
[root@ststor01 ecommerce]# git log
commit 4079b79b466f3a60a28dd32686acd5f68c253233 (HEAD -> feature)
Author: Admin <admin@kodekloud.com>
Date:   Mon Sep 29 03:07:24 2025 +0000

    Add new feature

commit 52da1c29ab1652674d6e517df450fcd0150c4e3c (origin/master, master)
Author: Admin <admin@kodekloud.com>
Date:   Mon Sep 29 03:07:24 2025 +0000

    Update info.txt

commit 553eef76fc9e443519a641b8354e1c74f90b4f26
Author: Admin <admin@kodekloud.com>
Date:   Mon Sep 29 03:07:24 2025 +0000

    initial commit
[root@ststor01 ecommerce]# git push origin feature -f
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 296 bytes | 296.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/ecommerce.git
 + 0ea32a3...4079b79 feature -> feature (forced update)
[root@ststor01 ecommerce]# 
```
2. as we are using rebase we dont get any new commits which how it is different from merge commit, a merge commit would combine the changes from both the branches and creates a new commit whereas rebase would rewrite history and makes it look like we were using the same latest master from the beginning we wont get any new commits in the history if we use rebase