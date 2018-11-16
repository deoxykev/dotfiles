### Resources
https://resources.infosecinstitute.com/dns-hacking/#gref

***
### A Records
* Maps an IP Address to a hostname.For e.g. 74.125.236.80 for google.com.
  
  
    nslookup
    set type=a             #set a records
    server ns1.google.com  #set dns server
    
    dig @1.1.1.1 <domain>  #returns A records

### Zone File
* txt file on server hosting domain that contains different resource records (RR)
* start of authority (SOA): authoritative nameserver for domain (like ns1.google.com for google.com)
* 

### MX Records (mail server)
* This basically tells us which server is responsible for receiving mails sent to that domain name.
  
  
    nslookup
    set type=mx
    google.com
    
### NS Records (nameserver)
* Delegates a given zone to use the given authoritative nameserver. 
  * ns1.google.com is an authoritative nameserver for google.com
  
  
    nslookup
    set type=ns
    google.com 


### TXT Records
* This consists of arbitrarily human readable text in a record.
* Sometimes used for verification

### CNAME Records
* Gives an alias of one name to another.

### PTR Records
* Used for reverse DNS queries, and to prevent spam for mail

### Zone Transfer (Intel Gathering on subdomains)
* Master server will give slave nameservers it's zone info. 
  * Usually it will only give the zone file to nameserver subdomains, but if not configured right will give that info to anybody.
* Zone Transfer (AXFR): enumeration, leaks info about subdomains if improperly configured


    fierce -dns google.com -wordlist dictionary.txt
    host -l <domain> <ns1.domain>

* Beware wildcard subdomains (*.google.com)
  * this is the case if the dns returns the same ip for different subdomains
  * only way around this is to bruteforce with `dirbuster` or `gobuster`

### Bruteforcing hostnames  (forward dns lookup)

    gobuster -m dns -i -u <domain.com> -w /path/to/wordlist
    
    host $name.domain.com | grep "has address" | cut -d" " -f1,4

### Reverse DNS query (reverse DNS lookup) (only works with PTR records)

    seq 1 255 | parallel host 10.10.10.{}  \| grep "domain name pointer"
    
### Other Tools
    
    dnsrecon -d zonetransfer.me 
    dnsenum zonetransfer.me

