#!/bin/bash
echo_and_run() { echo "\$ $@" ; "$@" ; }

echo "updating ghosty-git scripts"
echo_and_run cp ./ghosty-start.sh /usr/bin/ghosty-start &&
echo_and_run cp ./ghosty-stop.sh /usr/bin/ghosty-stop &&
echo_and_run cp ./ghosty-status.sh /usr/bin/ghosty-status &&
echo_and_run cp ./ghosty-mount.sh /usr/bin/ghosty-mount &&

echo_and_run cp ./depot-start.sh /usr/bin/depot-start &&
echo_and_run cp ./depot-stop.sh /usr/bin/depot-stop &&
echo_and_run cp ./depot-status.sh /usr/bin/depot-status &&
echo_and_run cp ./depot-mount.sh /usr/bin/depot-mount &&
echo_and_run cp ./depot-cron.py /usr/bin/depot-cron;
