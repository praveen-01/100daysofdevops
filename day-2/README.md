# Day-2 Temporary User Setup with Expiry
---
# Task
As part of the temporary assignment to the Nautilus project, a developer named john requires access for a limited duration. To ensure smooth access management, a temporary user account with an expiry date is needed. Here's what you need to do:
Create a user named john on App Server 3 in Stratos Datacenter. Set the expiry date to 2024-03-28, ensuring the user is created in lowercase as per standard protocol.

---
# Solution
1. we can `useradd` with flag `-e` to create user with an expiration date
2. apart from this particular flag we should try different scenarios to gain more handson

## commands used:
```
[banner@stapp03 ~]$ sudo useradd -e 2024-03-28 john
```

## Learnings:
we should know add useradd command and its usage for multiple sceanrios
```
    $ useradd --help
    Usage: useradd [options] LOGIN
        useradd -D
        useradd -D [options]

    Options:
        --badname                 do not check for bad names
    -b, --base-dir BASE_DIR       base directory for the home directory of the
                                    new account
        --btrfs-subvolume-home    use BTRFS subvolume for home directory
    -c, --comment COMMENT         GECOS field of the new account
    -d, --home-dir HOME_DIR       home directory of the new account
    -D, --defaults                print or change default useradd configuration
    -e, --expiredate EXPIRE_DATE  expiration date of the new account
    -f, --inactive INACTIVE       password inactivity period of the new account
    -g, --gid GROUP               name or ID of the primary group of the new
                                    account
    -G, --groups GROUPS           list of supplementary groups of the new
                                    account
    -h, --help                    display this help message and exit
    -k, --skel SKEL_DIR           use this alternative skeleton directory
    -K, --key KEY=VALUE           override /etc/login.defs defaults
    -l, --no-log-init             do not add the user to the lastlog and
                                    faillog databases
    -m, --create-home             create the user's home directory
    -M, --no-create-home          do not create the user's home directory
    -N, --no-user-group           do not create a group with the same name as
                                    the user
    -o, --non-unique              allow to create users with duplicate
                                    (non-unique) UID
    -p, --password PASSWORD       encrypted password of the new account
    -r, --system                  create a system account
    -R, --root CHROOT_DIR         directory to chroot into
    -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
    -s, --shell SHELL             login shell of the new account
    -u, --uid UID                 user ID of the new account
    -U, --user-group              create a group with the same name as the user
    -Z, --selinux-user SEUSER     use a specific SEUSER for the SELinux user mapping
```