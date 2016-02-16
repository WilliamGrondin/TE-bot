#!/bin/bash

BASEDIR=$(dirname $0)

echo -n "How many users ? [~1GB RAM/users] : "
read nbChromeUser;


echo "$nbChromeUser users";
echo "";
echo "country :";
echo -e "Argentina : ar\tAustralia : au\tBrazil : br\tCanada : ca\tFrance : fr";
echo -e "Germany : de\tItaly : it\tJaan : jp\tMexico : mx\tNetherland : nl";
echo -e "Poland : pl\tRussia : ru\tSouth africa : za\tSouth korea : kr\t"
echo -e "Spain : es\tSweden : se\tGreatBritain: gb\tUSA: us\t"

rm $BASEDIR/conutries


for i in `seq 1 $nbChromeUser`
do
echo -n "Select country for user$i : "
read country;
echo -e "$country" >> $BASEDIR/countries
echo "country modified"
done
