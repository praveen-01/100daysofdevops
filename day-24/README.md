# day-24 Git Create Branches

---

# Solution

1. This is pretty straight forward as we have to checkout to master and create a branch from it
```
[natasha@ststor01 media]$ git checkout master
fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/media'
To add an exception for this directory, call:
        git config --global --add safe.directory /usr/src/kodekloudrepos/media
[natasha@ststor01 media]$ git config --global --add safe.directory /usr/src/kodekloudrepos/media
[natasha@ststor01 media]$ sudo git checkout master
Your branch is up to date with 'origin/master'.
[natasha@ststor01 media]$ sudo git checkout -b xfusioncorp_media
Switched to a new branch 'xfusioncorp_media'
```