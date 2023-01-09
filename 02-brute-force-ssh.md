# Brute Force Attack Raspberry Pi

## Ideas

- write a Python Script to generate passwords
- download a top XX list of the most common passwords
- use a tool to generate passwords

## Questions

- how long does it take to try 100/1000/10.000/1.000.000 passwords?
-

## User NMAP for brute force attack

```
nmap -p 22 --script ssh-brute --script-args userdb=users.txt,passdb=passwords.txt --script-args unpwdb.timelimit=0 192.168.0.217
```
