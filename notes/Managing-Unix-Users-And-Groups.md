### Important User Files 
* /etc/passwd
  * list of users
* /etc/shadow 
  * encrypted pw of users
    * https://www.tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html
* /etc/group 
  * list of groups
* /etc/gshadow 
  * encrypted pw of groups

##### add users
  * `adduser`
    * `/etc/adduser.conf`

##### set default shell settings 
* `/etc/skel`
  * populates news user's .profile default settings

##### add sudo user:
* `adduser <user> <group>`
* `adduser <user> sudo`

##### change password
* `passwd`

##### change full name
* `chfn`

##### change shell
* `chsh`

##### change age (password expiration date)
* `chage -l <user> <time>`

##### disable account (lock)
* `passwd -l <user>`

##### enable account (unlock)
* `passwd -u <user>`

***

##### adding/deleting groups
* `addgroup <group>`
* `delgroup <group>`

##### change group password
* `gpasswdgroup <group>`

##### delete group password
* `passwd -r <group>`

***

### Misc notes
* use newgrp when working on a directory owned by a group that you aren't a part of in `id`
