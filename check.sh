#! /bin/bash 
wget -q http://login:password@ipadress/cgi-bin/snapshot.cgi -O /home/user/Downloads/autocheck/snapshot.cgi 
mv /home/user/Downloads/autocheck/snapshot.cgi /home/user/Downloads/autocheck/snapshot.jpg 
convert /home/user/Downloads/autocheck/snapshot.jpg -gravity Center -crop 45%\! /home/user/Downloads/autocheck/output.jpg 
FILENAME=$(alpr -c eu -d -n 1 /home/user/Downloads/autocheck/output.jpg |awk '{print $2}' | awk 'FNR>=2 && FNR<=4') 
if grep -Fxq "$FILENAME" /home/user/Downloads/autocheck/numbers.txt 
then 
echo CAR FOUND!, opening the gates! | while IFS= read -r line; do echo "$FILENAME, $(date) $line"; done >>/home/user/Downloads/autocheck/log.txt 
sh /home/user/Downloads/autocheck/relay-control/open.sh 2> /dev/null 
sh /home/user/Downloads/autocheck/tg.sh xGates "Car Found! Welcome" > log.out 2> /dev/null 
sh /home/user/Downloads/autocheck/tg.sh xGates  $FILENAME > log.out 2> /dev/null 
sh /home/user/Downloads/autocheck/tgphoto.sh xGates /home/user/Downloads/autocheck/output.jpg > log.out 2> /dev/null 
sleep 20 
sh /home/user/Downloads/autocheck/relay-control/open.sh 2> /dev/null 
elif [ -n "$FILENAME" ];  #if not empty 
then 
echo Unregistered car is at the gates! | while IFS= read -r line; do echo "$FILENAME, $(date) $line"; done >>/home/user/Downloads/autocheck/log.txt 
sh /home/user/Downloads/autocheck/relay-control/open.sh 2> /dev/null 
sh /home/user/Downloads/autocheck/tg.sh xGates "Unregistered car is at the gates!" > log.out 2> /dev/null 
sh /home/user/Downloads/autocheck/tg.sh xGates  $FILENAME > log.out 2> /dev/null 
sh /home/user/Downloads/autocheck/tgphoto.sh xGates /home/user/Downloads/autocheck/output.jpg > log.out 2> /dev/null 
sleep 20 
sh /home/user/Downloads/autocheck/relay-control/open.sh 2> /dev/null 
else 
2> /dev/null 
fi 
sleep 1 
exec bash "$0"  
