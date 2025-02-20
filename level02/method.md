## 1. Connect to level02:

```bash
level01@SnowCrash:~$ su level02
password: *use previously found flag*
```

## 2. See existing files:

```bash
level02@SnowCrash:~$ ls -l
    total 12
    ----r--r-- 1 flag02 level02 8302 Aug 30  2015 level02.pcap
```

## 3. Locally download the file (on local computer terminal, not VM):

```bash
level02@SnowCrash:~$ scp -P 4242 level02@<*your VM's IP address*>:/home/user/level02/level02.pcap /tmp
```

## 4. Give yourself the rights on the file:

```bash
level02@SnowCrash:~$ chmod 644 /tmp/level02.pcap
```

## 5. Use *`Wireshark`* application to open and read the .pcap file
Analyze > Follow > TCP Stream


## 6. Read the file and find the password
Be careful, the '.' are DEL characters!


## 7. Use found password *`abcde`* to log into *`flag02`*:

```bash
level02@SnowCrash:~$ su flag02
password: ft_waNDReL0L
```

## 8. Use `getflag` command to get flag for level03:

```bash
flag02@SnowCrash:~$ getflag
```