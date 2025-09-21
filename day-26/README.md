# Day-26: Manging remote servers
---
# Task
The xFusionCorp development team added updates to the project that is maintained under /opt/games.git repo and cloned under /usr/src/kodekloudrepos/games. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on /usr/src/kodekloudrepos/games repository as per details mentioned below:

a. In /usr/src/kodekloudrepos/games repo add a new remote dev_games and point it to /opt/xfusioncorp_games.git repository.

b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.

c. Finally push master branch to this new remote origin.
---
# Solution
```
    [root@ststor01 ~]# cd /usr/src/kodekloudrepos/news/
    [root@ststor01 news]# git remote add "dev_news" /opt/xfusioncorp_news.git
    [root@ststor01 news]# ls
    info.txt
    [root@ststor01 news]# cp /tmp/index.html .
    [root@ststor01 news]# git status
    On branch master
    Your branch is up to date with 'origin/master'.

    Untracked files:
    (use "git add <file>..." to include in what will be committed)
            index.html

    nothing added to commit but untracked files present (use "git add" to track)
    [root@ststor01 news]# git add .
    [root@ststor01 news]# git commit -m "changes"
    [master b1de7c2] changes
    1 file changed, 10 insertions(+)
    create mode 100644 index.html
    [root@ststor01 news]# git push -u dev_news master
    Enumerating objects: 6, done.
    Counting objects: 100% (6/6), done.
    Delta compression using up to 16 threads
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (6/6), 579 bytes | 579.00 KiB/s, done.
    Total 6 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
    To /opt/xfusioncorp_news.git
    * [new branch]      master -> master
    branch 'master' set up to track 'dev_news/master'.
    [root@ststor01 news]# 
```