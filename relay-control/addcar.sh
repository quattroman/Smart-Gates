#! /bin/bash

FILENAME=$(alpr -c eu -d -n 1 /home/swink/Downloads/autocheck/output.jpg |awk '{print $2}' | awk 'FNR>=2 && FNR<=4')
if [ -n "$FILENAME" ];  #if not empty
then
echo $FILENAME  >> /home/swink/Downloads/autocheck/numbers.txt

