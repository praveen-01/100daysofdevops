# Day-28
---
# Task
The Nautilus application development team has been working on a project repository /opt/official.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with the DevOps team:
There are two branches in this repository, master and feature. One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, the message for the commit that needs to be merged into master is Update info.txt. Accomplish this task for them, also remember to push your changes eventually.
---
# Solution
```
    [root@ststor01 official]# git branch
    * feature
    master
    [root@ststor01 official]# git log
    commit 0f1089349cd9fa5ee8cac966e2ac63aaacf4c369 (HEAD -> feature, origin/feature)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        Update welcome.txt

    commit 981fdf171f4dc783bf4bba87da69bb0129c12a16
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        Update info.txt

    commit 34936b9e82f83ccfb0823d881f856b86df1f3807 (origin/master, master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        Add welcome.txt

    commit bcd8f8f53cbf4eedee697b6d997df8ff799c5a34
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        initial commit
    [root@ststor01 official]# git checkout master
    Switched to branch 'master'
    Your branch is up to date with 'origin/master'.
    [root@ststor01 official]# git merge 981fdf171f4dc783bf4bba87da69bb0129c12a16
    Updating 34936b9..981fdf1
    Fast-forward
    info.txt | 2 +-
    1 file changed, 1 insertion(+), 1 deletion(-)
    [root@ststor01 official]# git log
    commit 981fdf171f4dc783bf4bba87da69bb0129c12a16 (HEAD -> master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        Update info.txt

    commit 34936b9e82f83ccfb0823d881f856b86df1f3807 (origin/master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        Add welcome.txt

    commit bcd8f8f53cbf4eedee697b6d997df8ff799c5a34
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:04:09 2025 +0000

        initial commit
    [root@ststor01 official]# 
    [root@ststor01 official]# git push origin master
    Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
    To /opt/official.git
    34936b9..981fdf1  master -> master
    [root@ststor01 official]# 
```