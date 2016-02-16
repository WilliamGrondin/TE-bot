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

#get country

readarray -t usersCountry < "$BASEDIR/countries"

#kill old process
killall -9 chromium-browser
killall -9 Xvfb
killall -9 sleep

sleep 2

#start virtual display

Xvfb :2 -screen 1 1024x768x16 -nolisten tcp & disown

sleep 2

#start chromium

rm -rf $BASEDIR/user*

for i in `seq 1 $nbChromeUser`
do

#recreate user dir

cp -r $BASEDIR/default-user $BASEDIR/user$i

echo "User$i country : ${usersCountry[$((i-1))]}"
sqlite3 $BASEDIR/user$i/Default/Local\ Storage/chrome-extension_gkojfkhlekighikafcpjkiklfbnlmeio_0.localstorage "UPDATE ItemTable SET value=replace(v$

url="${links[RANDOM % linksLength]}"
echo "URL = $url"
chromium-browser --user-data-dir="$BASEDIR/user$i/" --display=:2.1 "$url" > /dev/null & disown
sleep 20
done

