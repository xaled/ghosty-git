#!/bin/bash

umask 077 &&
echo "Enter password for homedepot:" &&
read -s pass &&
echo $pass > /etc/homedepot.pass &&
echo "Enter password for workdepot:" &&
read -s pass &&
echo $pass > /etc/workdepot.pass &&

umask 022 &&

cp ./depot-start.sh /usr/bin/depot-start
cp ./ghosty-start.sh /usr/bin/ghosty-start
cp ./depot-stop.sh /usr/bin/depot-stop
cp ./ghosty-stop.sh /usr/bin/ghosty-stop
cp ./depot-status.sh /usr/bin/depot-status
cp ./ghosty-status.sh /usr/bin/ghosty-status

echo "add this line in /etc/rc.local:" 
echo "/usr/bin/depot-start;"
echo "
if /etc/rc.local does not exist: 
execute ./install-rc-local.sh"
