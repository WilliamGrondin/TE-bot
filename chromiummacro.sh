#!/bin/bash

BASEDIR=$(dirname $0)
echo $BASEDIR

nbChromeUser=$1
echo "script nb-chrome-user"

#get links
wget --no-check-certificate -q https://raw.githubusercontent.com/WilliamGrondin/TE-bot/master/mylinks -O "$BASEDIR/links"
readarray -t links < "$BASEDIR/links"
linksLength=${#links[@]}

echo "Links : $linkLength"
for line in "${links[@]}";
do printf '%s\n' "$line";
done

#kill old process
killall -9 chromium-browser
killall -9 Xvfb

sleep 2

#start virtual display

Xvfb :2 -screen 1 1024x768x16 -nolisten tcp & disown

sleep 2

#start chromium

for i in `seq 1 $nbChromeUser`
do
url="${links[RANDOM % linksLength]}"
echo "URL = $url"
chromium-browser --user-data-dir=/root/chromium-user/user$i/ --display=:2.1 $url > /dev/null &
sleep 10
done
