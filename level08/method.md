## 1. Connect to level08:

```bash
level07@SnowCrash:~$ su level08
password: *use previously found flag*
```

## 2. See existing files:

```bash
level08@SnowCrash:~$ ls -l
    total 16
    -rwsr-s---+ 1 flag08 level08 8617 Mar  5  2016 level08
    -rw-------  1 flag08 flag08    26 Mar  5  2016 token
```

## 3. Locally download the file (on local computer terminal, not VM):

```bash
level08@SnowCrash:~$ scp -P 4242 level08@<your VM's IP address>:/home/user/level08/level08 ~
```

## 4. Use *`Ghidra`* application to convert file into readable code
Once open, look to the left, *Symbol Tree* > *Functions* > *main*
Look at the main and find:

```bash
pcVar1 = strstr((char *)in_stack_00000008[1],"token");
if (pcVar1 != (char *)0x0) {
  printf("You may not access \'%s\'\n",in_stack_00000008[1]);
                  /* WARNING: Subroutine does not return */
  exit(1);
}
```
This shows that if you try to use the program with a file called `token`, it will not allow access.
So we need to change the file's name !
But we don't have the rights to change the file's name in `/level08` directory...

## 5. Change the file's name to open with `level08` executable:
```bash
level08@SnowCrash:~$ pwd
    /home/user/level08

# Change directory to /user since we do not have any rights for /level08 directory
level08@SnowCrash:~$ cd ..
level08@SnowCrash:~$ pwd
    /home/user

# Give yourself rights for /level08 directory
level08@SnowCrash:~$ chmod +x level08

# Modify 'token' file name
level08@SnowCrash:~$ mv level08/token level08/netok
```

## 6. Executre `level08` executable with updated file:
```bash
level08@SnowCrash:~$ ./level08 netok
    quif5eloekouj29ke0vouxean
```

## 7. Login into *`flag08`* user account with obtained password:
```bash
level08@SnowCrash:~$ su flag08
password: quif5eloekouj29ke0vouxean
```

## 8. Use `getflag` command to get flag for level09:

```bash
flag08@SnowCrash:~$ getflag
```
