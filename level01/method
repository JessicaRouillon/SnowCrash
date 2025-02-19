1. Connect to level01:

level00@SnowCrash:~$ sulevel01
    password: *use previously found flag*


The */etc/passwd* and */etc/shadow* files are crucial in a Linux system for managing user accounts and passwords.

    */etc/passwd* contains information about system users.
    */etc/shadow* contains users' encrypted (hashed) passwords.


2. View */etc/shadow*:

level01@SnowCrash:~$ /etc/passwd
    [...]
	flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
	[...]


3. Install John the Ripper (https://github.com/openwall/john)


4. Dehash the password using John the Ripper program:

    - Create a file with hashed password
        *echo "42hDRfypTqqnw" > password.txt*
    - Use it with *john* program
        *./john ../../password.txt*
    - Show the password
        *./john --show ../../password.txt*
    - Result = *?:abcdefg*


5. Use found password *abcde* to log into *flag01*:

level01@SnowCrash:~$ su flag01
    password: abcde


6. Use *getflag* command to get flag for level02:

flag01@SnowCrash:~$ getflag