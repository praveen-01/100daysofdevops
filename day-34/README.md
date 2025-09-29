# Day 34 Git Hook
---
# Task
The Nautilus application development team was working on a git repository /opt/beta.git which is cloned under /usr/src/kodekloudrepos directory present on Storage server in Stratos DC. The team want to setup a hook on this repository, please find below more details:
Merge the feature branch into the master branch`, but before pushing your changes complete below point.
Create a post-update hook in this git repository so that whenever any changes are pushed to the master branch, it creates a release tag with name release-2023-06-15, where 2023-06-15 is supposed to be the current date. For example if today is 20th June, 2023 then the release tag must be release-2023-06-20. Make sure you test the hook at least once and create a release tag for today's release.
Finally remember to push your changes.
Note: Perform this task using the natasha user, and ensure the repository or existing directory permissions are not altered.
---
# Solution

```
[natasha@ststor01 beta]$ git branch
* feature
  master
[natasha@ststor01 beta]$ cd /opt/beta.git/
[natasha@ststor01 beta.git]$ ls
HEAD  branches  config  description  hooks  info  objects  refs
[natasha@ststor01 beta.git]$ cd hooks/
[natasha@ststor01 hooks]$ ls
applypatch-msg.sample      pre-commit.sample        prepare-commit-msg.sample
commit-msg.sample          pre-merge-commit.sample  push-to-checkout.sample
fsmonitor-watchman.sample  pre-push.sample          sendemail-validate.sample
post-update.sample         pre-rebase.sample        update.sample
pre-applypatch.sample      pre-receive.sample
[natasha@ststor01 hooks]$ 
[natasha@ststor01 hooks]$ mv post-update.sample post-update
[natasha@ststor01 hooks]$ vi post-update 
[natasha@ststor01 hooks]$ 
[natasha@ststor01 hooks]$ cd /usr/src/kodekloudrepos/beta
[natasha@ststor01 beta]$ vi /opt/beta.git/hooks/post-update
[natasha@ststor01 beta]$ git merge feature
Updating 7f1d1ae..64d9cda
Fast-forward
 feature.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 feature.txt
[natasha@ststor01 beta]$ 
[natasha@ststor01 beta]$ git push origin master
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
remote: fatal: 'origin' does not appear to be a git repository
remote: fatal: Could not read from remote repository.
remote: 
remote: Please make sure you have the correct access rights
remote: and the repository exists.
To /opt/beta.git
   7f1d1ae..64d9cda  master -> master
[natasha@ststor01 beta]$ git fetch
From /opt/beta
 * [new tag]         release-2025-09-29 -> release-2025-09-29
[natasha@ststor01 beta]$ cat /opt/beta.git/hooks/post-update 
#!/bin/bash
#
# An example hook script to prepare a packed repository for use over
# dumb transports.
#
# To enable this hook, rename this file to "post-update".

branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)

if [ "$branch" == "master" ]; then
        date=$(date +'%Y-%m-%d')
        tag="release-$date"
        git tag $tag
        git push origin $tag
fi


[natasha@ststor01 beta]$ 
```
