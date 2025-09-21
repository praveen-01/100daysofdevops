# Day-27
---
# Task
The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/beta present on Storage server in Stratos DC. However, they reported an issue with the recent commits being pushed to this repo. They have asked the DevOps team to revert repo HEAD to last commit. Below are more details about the task:
In /usr/src/kodekloudrepos/news git repository, revert the latest commit ( HEAD ) to the previous commit (JFYI the previous commit hash should be with initial commit message ).
Use revert beta message (please use all small letters for commit message) for the new revert commit.
---
# Solution
```
    [root@ststor01 ~]# cd /usr/src/kodekloudrepos/beta
    [root@ststor01 beta]# git log
    commit d3b21eddb894dc842602494902429ab331e37ae7 (HEAD -> master, origin/master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 10:58:48 2025 +0000

        add data.txt file

    commit 5cfa56f0779f6238b37445116f350bc6363f68e7
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 10:58:48 2025 +0000

        initial commit
    [root@ststor01 beta]# git revert HEAD -m 1 -n
    [root@ststor01 beta]# git log
    commit d3b21eddb894dc842602494902429ab331e37ae7 (HEAD -> master, origin/master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 10:58:48 2025 +0000

        add data.txt file

    commit 5cfa56f0779f6238b37445116f350bc6363f68e7
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 10:58:48 2025 +0000

        initial commit
    [root@ststor01 beta]# git status
    On branch master
    Your branch is up to date with 'origin/master'.

    You are currently reverting commit d3b21ed.
    (all conflicts fixed: run "git revert --continue")
    (use "git revert --skip" to skip this patch)
    (use "git revert --abort" to cancel the revert operation)

    Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
            new file:   info.txt

    Untracked files:
    (use "git add <file>..." to include in what will be committed)
            beta.txt

    [root@ststor01 beta]# 
    [root@ststor01 beta]# git commit -m "revert beta"
    [master 614fb60] revert beta
    1 file changed, 1 insertion(+)
    create mode 100644 info.txt
    [root@ststor01 beta]# 
    [root@ststor01 beta]# git log
    commit 614fb60be2daab506fcf6bc17de2c9a582901e75 (HEAD -> master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 11:01:30 2025 +0000

        revert beta

    commit d3b21eddb894dc842602494902429ab331e37ae7 (origin/master)
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 10:58:48 2025 +0000

        add data.txt file

    commit 5cfa56f0779f6238b37445116f350bc6363f68e7
    Author: Admin <admin@kodekloud.com>
    Date:   Sun Sep 21 10:58:48 2025 +0000

        initial commit
    [root@ststor01 beta]# 
```