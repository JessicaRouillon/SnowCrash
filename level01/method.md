## 1. Connect to level01:

```bash
level00@SnowCrash:~$ su level01
password: *use previously found flag*
```

The `/etc/passwd` and `/etc/shadow` files are crucial in a Linux system for managing user accounts and passwords.

- `/etc/passwd` contains information about system users.
- `/etc/shadow` contains users' encrypted (hashed) passwords.

## 2. View `/etc/shadow`:

```bash
level01@SnowCrash:~$ /etc/passwd
```

Example output:

```bash
[...]
flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
[...]
```

## 3. Install John the Ripper

John the Ripper is an open-source password cracking tool. You can find it here: [John the Ripper on GitHub](https://github.com/openwall/john)

## 4. Dehash the password using John the Ripper

### Create a file with the hashed password:
```bash
echo "42hDRfypTqqnw" > password.txt
```

### Use it with *`john`* program:
```bash
./john ../../password.txt
```

### Show the password:
```bash
./john --show ../../password.txt
```

### Example result:
```bash
?:abcdefg
```

## 5. Use found password *`abcde`* to log into *`flag01`*:

```bash
level01@SnowCrash:~$ su flag01
password: abcde
```

## 6. Use `getflag` command to get flag for level02:

```bash
flag01@SnowCrash:~$ getflag
```