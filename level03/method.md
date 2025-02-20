1. Connect to level03:

    level02@SnowCrash:~$ sulevel03
    password: *use previously found flag*


2. See existing files:

    level03@SnowCrash:~$ ls -l
    total 12
	-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03


3. Locally download the file (on local computer terminal, not VM):

    level02@SnowCrash:~$ scp -P 4242 level03@192.168.56.102:/home/user/level03/level03 ~


4. Use *Ghidra* application to convert file into readable code. Once open, look to the left, *Symbol Tree* > *Functions* > *main*.