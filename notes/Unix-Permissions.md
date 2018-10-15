### Unix Permissions
* read = 4        r
* write = 2       w
* execute = 1     x
* directory cd    X

### Optional bits
* Prefixed in front
  * usually octal perms (4777)
    * setuid = 4      s
    * setgid = 2      s
    * sticky bit = 1  s
* (sticky bit prevents other users from deleting files that everyone can write to)
  * check umask in .bashrc, if improperly set, will allow write by other (000)
