# Day 31 Git Stash
---
# Task
The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/apps present on Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:
Look for the stashed changes under /usr/src/kodekloudrepos/apps git repository, and restore the stash with stash@{1} identifier. Further, commit and push your changes to the origin.
---
# Solution
1. look at all stashes using `git stash list`
2. copy the stash id which we wanted to apply to our current branch and then run apply to apply the changes onto ur branch

```
[root@ststor01 apps]# git stash apply stash@{1}
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   welcome.txt
```
