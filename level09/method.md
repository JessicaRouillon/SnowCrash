## 1. Connect to level09:

```bash
level08@SnowCrash:~$ su level09
password: *use previously found flag*
```

## 2. See existing files:

```bash
level09@SnowCrash:~$ ls -l
    total 12
    -rwsr-sr-x 1 flag09 level09 7640 Mar  5  2016 level09
    ----r--r-- 1 flag09 level09   26 Mar  5  2016 token
```

```bash
level09@SnowCrash:~$ cat token
	f4kmm6p|=�p�n��DB�Du{��

level09@SnowCrash:~$ ./level09 $(cat token)
	f5mpq;v�E��{�{��TS�W�����
```

## 3. Guess what the `level09` program does:
```bash
level09@SnowCrash:~$ ./level09 123
    165

level09@SnowCrash:~$ ./level09 111111
    123456

level09@SnowCrash:~$ ./level09 abc
    ace

level09@SnowCrash:~$ ./level09 9876543210
    9999999999
```

From observing the results, we can guess that `level09` program takes the `i` index of each character of the string and adds the respective `i` to the value of each character.
Here is an example:

```bash
// Example for ./level09 111111
	// 1 + 0 = 1
	// 1 + 1 = 2
	// 1 + 2 = 3
	// 1 + 3 = 4
	// 1 + 4 = 5
	// 1 + 5 = 6
```

We should now do the opposite of this program with the `token` file.

## 4. Create script to do the opposite of `level09` program:

```bash
# Go to /tmp for right purposes and create script file
level09@SnowCrash:~$ cd /tmp
level09@SnowCrash:~$ touch decode.c
```

See level09/Ressources/decode.c for script content

```bash
# In /tmp, create the executable for our .c script and give it the name 'decode'
level09@SnowCrash:~$ gcc decode.c -o decode
```

## 5. Execute script with `token`:
```bash
# Go back to home/user/level09 and execute
level09@SnowCrash:~$ cat token | xargs /tmp/decode
    f3iji1ju5yuevaus41q1afiuq
```

## 7. Login into *`flag09`* user account with obtained password:
```bash
level09@SnowCrash:~$ su flag09
password: f3iji1ju5yuevaus41q1afiuq
```

## 8. Use `getflag` command to get flag for level10:

```bash
flag09@SnowCrash:~$ getflag
```