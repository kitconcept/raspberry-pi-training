# 01 - Setup and Login via SSH

## Set Up Raspberry Pi

- connect Raspberry Pi to the power connector
- connect Raspberry Pi to the network
- connect mouse and keyboard
- set username to kitconcept
- set passwort to 1234

## Enable SSH on the Raspberry Pi

Öffnen Sie dafür über das Startmenü von Raspbian das Menü “Einstellungen - Raspberry-Pi-Konfiguration”. In diesem Menü wechseln Sie auf den Reiter “Schnittstellen” und stellen den Punkt “SSH” auf “Aktiviert” um. Nach einem Klick auf “Ok” müssen Sie den Raspberry Pi einmalig neu starten, um den SSH-Zugriff einzuschalten.

Quelle: https://www.heise.de/tipps-tricks/Raspberry-Pi-SSH-einrichten-so-geht-s-4190645.html#SSH%20auf%20dem%20Raspberry%20Pi%20installieren

## Connect to Raspberry Pi via SSH

### Find IP address

To connect to the Raspberry Pi via the network, we have to find its IP address.

#### Install NMAP

Install the `nmap` network scanner via:

```
sudo apt install nmap
```

on Linux (Ubuntu) or via:

```
brew install nmap
```

on OS X.

#### Find out in what network you are

Find out in what local network you are by running traceroute. Traceroute will give you a detailed overview over all network nodes that an IP package will pass through on its journey through the network.

Run:

```
traceroute google.com
```

The output will look like this:

```
traceroute to google.com (172.217.18.14), 64 hops max, 52 byte packets
 1  kabelbox.local (192.168.0.1)  7.688 ms  6.837 ms  6.335 ms
 2  ip-081-210-178-029.um21.pools.vodafone-ip.de (81.210.178.29)  42.323 ms  14.883 ms  15.246 ms
 3  de-bon01a-rd03-ae-0-0.aorta.net (84.116.196.146)  20.604 ms  20.279 ms  25.283 ms
 4  de-fra04d-rc1-ae-12-0.aorta.net (84.116.196.141)  18.041 ms  22.296 ms  20.665 ms
 5  84.116.190.94 (84.116.190.94)  19.236 ms  18.146 ms  19.489 ms
 6  74.125.32.52 (74.125.32.52)  25.486 ms  20.145 ms  21.455 ms
...
```

The first entry will tell you local router.

You can also run ifconfig:

```
ifconfig
```

The output will look something like this:

```
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.216  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 2a02:908:697:7fe0::be72  prefixlen 128  scopeid 0x0<global>
        inet6 fe80::dfbd:3f17:11d:6754  prefixlen 64  scopeid 0x20<link>
        ether e4:5f:01:f9:c5:44  txqueuelen 1000  (Ethernet)
        RX packets 17410  bytes 21256001 (20.2 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5351  bytes 613667 (599.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

With the output of traceroute (router address) and ifconfig (netmask, broadcast), you can tell that you have a class C network:

255.255.255.0 = 24 11111111.11111111.11111111 .00000000

Another way of writing this (without the netmask) is:

192.168.0.0/24

This means the available IP adresses are from:

192.168.0.1 - 192.168.0.255

You can see the calculation here:

https://jodies.de/ipcalc?host=192.168.0.1&mask1=24&mask2=

More reading: https://www.zytrax.com/tech/protocols/ip-classes.html

Now that we know the network we are on, we can start scanning our network for the Raspberry Pi.

#### Find IP Address via NMAP

To find the IP address of the Raspberry Pi on the network, run nmap with the class C network:

```
nmap -F 192.168.0.0/24
```

Example output:

```
nmap -F 192.168.0.0/24
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-25 15:46 CET
Nmap scan report for kabelbox.local (192.168.0.1)
Host is up (0.0050s latency).
Not shown: 95 closed tcp ports (conn-refused)
PORT    STATE    SERVICE
22/tcp  filtered ssh
23/tcp  filtered telnet
53/tcp  open     domain
80/tcp  open     http
111/tcp filtered rpcbind

Nmap scan report for 192.168.0.7
Host is up (0.0081s latency).
All 100 scanned ports on 192.168.0.7 are in ignored states.
Not shown: 100 closed tcp ports (conn-refused)

Nmap scan report for 0011F6A711B4 (192.168.0.183)
Host is up (0.0065s latency).
Not shown: 98 closed tcp ports (conn-refused)
PORT     STATE SERVICE
80/tcp   open  http
8080/tcp open  http-proxy

Nmap scan report for Office (192.168.0.196)
Host is up (0.0083s latency).
Not shown: 97 closed tcp ports (conn-refused)
PORT      STATE SERVICE
5000/tcp  open  upnp
49152/tcp open  unknown
49153/tcp open  unknown

Nmap scan report for raspberrypi-2 (192.168.0.216)
Host is up (0.0061s latency).
Not shown: 99 closed tcp ports (conn-refused)
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for raspberrypi (192.168.0.217)
Host is up (0.0065s latency).
Not shown: 99 closed tcp ports (conn-refused)
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 256 IP addresses (6 hosts up) scanned in 25.45 seconds
```

### Login via SSH

You can now login to the Raspberry Pi via SSH now:

```
ssh kitconcept@192.168.0.216
```
