#!/bin/bash
if [ -z "$2" ]; then
    echo "need two argument: user reponame";
    exit 1;
fi

USER=$1
REPO_NAME=$2


REPO_BASE_DIR=/home/$USER/.repos
REPO_DIR=/home/$USER/.repos/$REPO_NAME


res=`mount -l | grep $REPO_DIR`
if [ -z "$res" ]; then
    echo "encfs drive is not mounted."
else
    echo "Unmounting encfs drive...";
    umount $REPO_DIR
fi
