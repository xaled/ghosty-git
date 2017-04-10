#!/bin/bash


if [ -z "$2" ]; then
    echo "need two argument: user reponame";
    exit 1;
fi
#echo "user:"
#read USER
#echo "repo name:"
#read REPO_NAME
USER=$1
REPO_NAME=$2


REPO_BASE_DIR=/home/$USER/.repos
REPO_DIR=/home/$USER/.repos/$REPO_NAME
REPO_ENC_DIR=/home/$USER/.repos/$REPO_NAME.enc
REPO_CLOUDDATA_DIR=/home/$USER/.repos/$REPO_NAME.cld


res=`mount -l | grep $REPO_DIR`
if [ -z "$res" ]; then
    echo "encfs drive is not mounted"
else
    echo "unmounting encfs drive...";
    umount $REPO_DIR
fi

res=`docker ps| grep $REPO_NAME`;
if [ -z "$res" ]; then
    echo "There is no running instance of $REPO_NAME";
    res2=`docker ps -a | grep $REPO_NAME`;
    if [ -z "$res2" ]; then
       echo "There is no stopped instance of $REPO_NAME"
    else
       echo "Deleting old instance of $REPO_NAME";
       docker rm $REPO_NAME;
    fi
else
    echo "Stopping running instance of $REPO_NAME";
    docker kill $REPO_NAME;
    docker rm $REPO_NAME;
fi


