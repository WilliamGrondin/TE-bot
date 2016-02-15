#!/bin/bash

BASEDIR=$(dirname $0)

echo -n "How many users ? [~1GB RAM/users] : "
read nbChromeUser;

rm -rf $BASEDIR/user*

echo "$nbChromeUser users";
echo "";
echo "country :";
echo -e "Argentina : ar\tAustralia : au\tBrazil : br\tCanada : ca\tFrance : fr";
echo -e "Germany : de\tItaly : it\tJaan : jp\tMexico : mx\tNetherland : nl";
echo -e "Poland : pl\tRussia : ru\tSouth africa : za\tSouth korea : kr\t"
echo -e "Spain : es\tSweden : se\tGreatBritain: gb\tUSA: us\t"

for i in `seq 1 $nbChromeUser`
do
cp -r $BASEDIR/default-user $BASEDIR/user$i
echo -n "Select country for user$i : "
read country;
sqlite3 $BASEDIR/user$i/Default/Local\ Storage/chrome-extension_gkojfkhlekighikafcpjkiklfbnlmeio_0.localstorage "UPDATE ItemTable SET value=replace(value,'ca','$country') WHERE key='be_rules';"
echo "country modified"
done
