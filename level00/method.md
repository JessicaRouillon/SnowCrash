=> We need to find the password to sign into *flag00* user account


1. Find all files related to user flag00 (starting from the home directory) and put all errors in /dev/null so that they don’t pollute the terminal:

level00@SnowCrash:~$ find / -user flag00 2> /dev/null


2. Read the files for which we have permission:

level00@SnowCrash:~$ cat /usr/sbin/john
    cdiiddwpgswtgt
level00@SnowCrash:~$ cat /rofs/sbin/john
    cdiiddwpgswtgt


3. User https://www.dcode.fr/chiffre-cesar to decode the password


4. Connect to *flag00* user account with the decoded password:

level00@SnowCrash:~$ su flag00
    password : *use decoded password*


5. Use *getflag* command to get flag for level01:

flag00@SnowCrash:~$ getflag