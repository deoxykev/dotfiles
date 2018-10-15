### Remote Forwarding
* Let remote view the client's http (80) server on their localhost 8080
 
 
    ssh -R 8080:localhost:80 remote@host

### Local Forwarding
* Tunnels local traffic through ssh tunnel (bypass firewalled 5901)
  
  
    ssh -L 5901:localhost:5901 remote@host

