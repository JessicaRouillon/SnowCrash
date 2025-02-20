## 1. Connect to level14:

```bash
level13@SnowCrash:~$ su level14
password: *use previously found flag*
```

## 2. See existing files:

```bash
level14@SnowCrash:~$ ls -l
    -rwsr-sr-x 1 flag14 level14 7303 Aug 30  2015 level14
```

## 3. Locally download the file (on local computer terminal, not VM):

```bash
level14@SnowCrash:~$ scp -P 4242 level14@<your VM's IP address>:/home/user/level14/level14 ~
```

## 4. Use *`Ghidra`* application to convert file into readable code:
Once open, look to the left, *Symbol Tree* > *Functions* > *main*
In the main, find the last call to `ft_des` function and click on it.
It will bring to the location of the function and its memory address.

## 5. Use gdb to jump to one step before the last call of `ft_des`:
```bash
level14@SnowCrash:~$ gdb level14 -q
(gdb) b main
    Breakpoint 1 at 0x804894a
(gdb) run
    Starting program: /bin/getflag 

    Breakpoint 1, 0x0804894a in main ()
(gdb) jump *0x08048de5           # jump to the last call of ft_des
    Continuing at 0x8048de5.
    7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
    *** stack smashing detected ***: /bin/getflag terminated
    ======= Backtrace: =========
    /lib/i386-linux-gnu/libc.so.6(__fortify_fail+0x45)[0xb7f2fd95]
    /lib/i386-linux-gnu/libc.so.6(+0x103d4a)[0xb7f2fd4a]
    /bin/getflag[0x8048ec7]
    /lib/i386-linux-gnu/libc.so.6(__libc_start_main+0xf3)[0xb7e454d3]
    /bin/getflag[0x8048571]
    [...]
```