# Day-70: Configure Jenkins User Access
---
# Task
The Nautilus team is integrating Jenkins into their CI/CD pipelines. After setting up a new Jenkins server, they're now configuring user access for the development team, Follow these steps:
1. Click on the Jenkins button on the top bar to access the Jenkins UI. Login with username admin and password Adm!n321.
2. Create a jenkins user named ammar with the password GyQkFRVNr3. Their full name should match Ammar.
3. Utilize the Project-based Matrix Authorization Strategy to assign overall read permission to the ammar user.
4. Remove all permissions for Anonymous users (if any) ensuring that the admin user retains overall Administer permissions.
5. For the existing job, grant ammar user only read permissions, disregarding other permissions such as Agent, SCM etc.
---
1. Create a user with given details
2. In Jenkins Settings(Manager Jenkins) and under Global Security select `Project-based Matrix Authorization Strategy`
3. Set the permissions for created user as overall read and also for admin as  overall administer
4. go to Hello world job and give the created user permission to read only
5. Logout and login as james and check whether you only have read permissions for the job