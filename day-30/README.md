# Day 30 Git hard reset
---
# Task
The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/blog present on Storage server in Stratos DC. This was just a test repository and one of the developers just pushed a couple of changes for testing, but now they want to clean this repository along with the commit history/work tree, so they want to point back the HEAD and the branch itself to a commit with message add data.txt file. Find below more details:

In /usr/src/kodekloudrepos/blog git repository, reset the git commit history so that there are only two commits in the commit history i.e initial commit and add data.txt file.
Also make sure to push your changes

---
# Solution
1. we have to reset the test commits that were made 
2. use `git reset --hard` to reset the commits and remove all the changes made in those commits


```
[root@ststor01 ~]# cd /usr/src/kodekloudrepos/blog/
[root@ststor01 blog]# ls -a
.  ..  .git  blog.txt  info.txt
[root@ststor01 blog]# git log
commit a1ec857c4539dbbf07ec795d34c1bc51103da9a2 (HEAD -> master, origin/master)
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit10

commit 9d1337a82951dbe8f821ba6c06221cc7d3d6f560
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit9

commit b5a25a352fcfe4058247e32d7cb4daffd9d6776d
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit8

commit 1130d08f4d4b4ba89c02a27105b12df3a7f90b7a
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit7

commit eaf364cd1a92a972f8c4d0fbc108e8a7f9c7a6b6
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit6

commit 621072a348353417a4d57abaa1d1852e6cbf7439
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit5

commit c94706c2e4fe154892927434c26e9616e703014e
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit4

commit bf2da40a5d8e26c9c90810e0c178640bf65ffaaf
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit3

commit e931e86916f54a9fea19222c4ad6c83a61c306b9
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit2

commit 36d597ff5b396d3ff41984f4a55d96746a55328b
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    Test Commit1

commit 7b69966950cf8d31796f0a24892ceb9fc0f66c3e
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    add data.txt file

commit 4f2c0701ec203a3b0bb80debc699a8638300e7f0
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    initial commit
[root@ststor01 blog]# git reset --hard HEAD~10
HEAD is now at 7b69966 add data.txt file
[root@ststor01 blog]# 
[root@ststor01 blog]# git log
commit 7b69966950cf8d31796f0a24892ceb9fc0f66c3e (HEAD -> master)
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    add data.txt file

commit 4f2c0701ec203a3b0bb80debc699a8638300e7f0
Author: Admin <admin@kodekloud.com>
Date:   Tue Sep 23 02:59:40 2025 +0000

    initial commit
[root@ststor01 blog]# git push origin master -f
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/blog.git
 + a1ec857...7b69966 master -> master (forced update)
[root@ststor01 blog]# 
```
## Learnings:
we have three kinds of resets
1. soft reset:
   Moves HEAD to target commit
   keeps our working directory and staging area intact
   commits are undo, but changes remain staged we can commit them again
   usage `git reset --soft <commit>`

2. hard reset:
    Moves HEAD to a target commit
    clears staging area and working directory and all changes made are lost
    usage: `git reset --hard <commit>`

3. mixed reset: 
    Moves HEAD to a target commit
    keeps changes in working directory but unstages then in staging area we have to add then back
    usage: `git reset <commit>`

