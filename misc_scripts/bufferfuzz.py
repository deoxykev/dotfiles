#!/usr/bin/python2
import socket, sys, time, struct
if len(sys.argv) < 2:
    print("[-] USAGE: %s <RHOST> <RPORT> <int_bytes> "% sys.argv[0] + "\r")
    sys.exit(1)

rhost    = sys.argv[1]
rport    = int(sys.argv[2])
maxNumBytes = int(sys.argv[3])

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

payload = '\x41' * maxNumBytes + '\n'

try:
    s.connect((rhost, rport))
except:
    print("[-] Could not connect to %s"% rhost + ":%s"% rport)
    sys.exit(1)

try:
    print("[+] Sending %s"% len(payload) + " bytes." )
    s.send(payload)
    time.sleep(0.2)
    s.shutdown(socket.SHUT_WR)

except:
    print("[-] Send data failed.")
    sys.exit(1)


try: 
    data = ""
    while True:
        datum = s.recv(2)
        if not datum: break
        data += datum
    print(data)

except:
    print("[-] Receive data failed.")
    sys.exit(1)
finally:
    s.close()

sys.exit(0)
