## TCP IP Resources
https://www.ipaddressguide.com/cidr - CIDR Reference

### Basics
***
* Network ID
  * What part of the network are we on?
    * **192.168.1**.1
* Host ID
  * what computer are you actually on?
    * 192.168.1.**1**

* Subnet mask
  * 255.255.255.0
     * 255 in IP addr - broadcast to all IP's in subnet
  * If two IPs are on the same subnet mask, they can talk to each other

* CIDR notation
  * /24, /8, /12

| CIDR | Subnet Mask   | IP range                |
|------|---------------|-------------------------|
| /24  | 255.255.255.0 | 0.0.0.0 - 0.0.0.255     |
| /23  | 255.255.254.0 | 0.0.0.0 - 0.0.1.255     |
| /22  | 255.255.252.0 | 0.0.0.0 - 0.0.3.255     |
| /21  | 255.255.248.0 | 0.0.0.0 - 0.0.7.255     |
| /20  | 255.255.240.0 | 0.0.0.0 - 0.0.15.255    |
| /19  | 255.255.224.0 | 0.0.0.0 - 0.0.31.255    |
| /18  | 255.255.192.0 | 0.0.0.0 - 0.0.63.255    |
| /16  | 255.255.000.0 | 0.0.0.0 - 0.0.255.255   |
| /12  | 255.240.000.0 | 0.0.0.0 - 0.15.255.255  |
| /8   | 255.000.000.0 | 0.0.0.0 - 0.255.255.255 |

* Private Networks (BOGON)
  * 10.0.0.0/8
  * 172.16.0.0/12
  * 192.168.0.0/26 

* APIPA
  * 169.254.0.0 
    * when host cannot be assigned an IP, it may be assigned one of these addresses

* Multicast: 
  * FFxx:___________
* Anycast ipv6
  * send msg to anyone close to us

