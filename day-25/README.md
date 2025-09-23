# day-25 Git Merge Branches
---
# Task
The Nautilus application development team has been working on a project repository /opt/apps.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:
Create a new branch datacenter in /usr/src/kodekloudrepos/apps repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.

---
# Solution
1. Very easy just follow along the insturactions in the task, it is very straight forward

```
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ 
[natasha@ststor01 kodekloudrepos]$ ls
apps
[natasha@ststor01 kodekloudrepos]$ cd apps
[natasha@ststor01 apps]$ ls
info.txt  welcome.txt
[natasha@ststor01 apps]$ git branch
fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/apps'
To add an exception for this directory, call:

        git config --global --add safe.directory /usr/src/kodekloudrepos/apps
[natasha@ststor01 apps]$ git config --global --add safe.directory /usr/src/kodekloudrepos/apps
[natasha@ststor01 apps]$ git branch
* master
[natasha@ststor01 apps]$ sudo git checkout -b datacenter

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for natasha: 
Switched to a new branch 'datacenter'
[natasha@ststor01 apps]$ sudo cp /tmp/index.html .
[natasha@ststor01 apps]$ ls -ltrh
total 12K
-rw-r--r-- 1 root root 26 Sep 18 02:59 welcome.txt
-rw-r--r-- 1 root root 34 Sep 18 02:59 info.txt
-rw-r--r-- 1 root root 27 Sep 18 03:02 index.html
[natasha@ststor01 apps]$ sudo git status
On branch datacenter
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        index.html

nothing added to commit but untracked files present (use "git add" to track)
[natasha@ststor01 apps]$ 
[natasha@ststor01 apps]$ sudo git add .
[natasha@ststor01 apps]$ sudo git commit -m "changes"
[datacenter e3e3e4e] changes
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
[natasha@ststor01 apps]$ sudo git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[natasha@ststor01 apps]$ sudo git merge datacenter
Updating faa97bf..e3e3e4e
Fast-forward
 index.html | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
[natasha@ststor01 apps]$ 
[natasha@ststor01 apps]$ sudo git push origin master
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 326 bytes | 326.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/apps.git
   faa97bf..e3e3e4e  master -> master
[natasha@ststor01 apps]$ sudo git checkout datacenter
Switched to branch 'datacenter'
[natasha@ststor01 apps]$ sudo git push origin datacenter
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/apps.git
 * [new branch]      datacenter -> datacenter
```