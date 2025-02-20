## 1. Connect to level13:

```bash
level12@SnowCrash:~$ su level13
password: *use previously found flag*
```

## 2. See existing files:

```bash
level13@SnowCrash:~$ ls -l
    -rwsr-sr-x 1 flag13 level13 7303 Aug 30  2015 level13
```

## 3. Locally download the file (on local computer terminal, not VM):

```bash
level13@SnowCrash:~$ scp -P 4242 level13@<your VM's IP address>:/home/user/level13/level13 ~
```

## 4. Use *`Ghidra`* application to convert file into readable code:
Once open, look to the left, *Symbol Tree* > *Functions* > *main*
In the main, find the `ft_des` function and click on it.
It will bring to the location of the function and its memory address.

## 5. Use gdb to jump to one step before the `ft_des`'s address:

```bash
level13@SnowCrash:~$ gdb level13 -q
    Reading symbols from /home/user/level13/level13...(no debugging symbols found)...done.
(gdb) b main
    Breakpoint 1 at 0x804858f
(gdb) run
    Starting program: /home/user/level13/level13 

    Breakpoint 1, 0x0804858f in main ()
(gdb) jump *0x080485cb              # jump one step before the call to ft_des
    Continuing at 0x80485cb.
    your token is 2A31L79asukciNyi8uppkEuSx

    Program received signal SIGSEGV, Segmentation fault.
    0x0804b008 in ?? ()
(gdb) 
```