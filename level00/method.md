=> We need to find the password to sign into *flag00* user account


## 1. Find all files related to user *`flag00`*:
Starting from the home directory. Put all errors in /dev/null so that they don’t pollute the terminal.

```bash
level00@SnowCrash:~$ find / -user flag00 2> /dev/null
```

## 2. Read the files for which we have permission:

```bash
level00@SnowCrash:~$ cat /usr/sbin/john
    cdiiddwpgswtgt
level00@SnowCrash:~$ cat /rofs/sbin/john
    cdiiddwpgswtgt
```

## 3. Use [Chiffre Cesar Decoder](https://www.dcode.fr/chiffre-cesar) to decode the password

## 4. Connect to *`flag00`* user account with the decoded password:

```bash
level00@SnowCrash:~$ su flag00
password : *use decoded password*
```

## 5. Use `getflag` command to get flag for level01:

```bash
flag00@SnowCrash:~$ getflag
```