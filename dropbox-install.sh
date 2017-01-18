#!/bin/bash

if [ -z "$1" ]; then
    echo "need one argument: repository name";
    exit 1;
fi

# Dirs
REPO_NAME=$1
REPO_BASE_DIR=/home/xaled/.repos
REPO_DIR=/home/xaled/.repos/$REPO_NAME
REPO_ENC_DIR=/home/xaled/.repos/$REPO_NAME.enc
REPO_CLOUDDATA_DIR=/home/xaled/.repos/$REPO_NAME.cld



mkdir -p $REPO_DIR
mkdir -p $REPO_ENC_DIR
mkdir -p $REPO_CLOUDDATA_DIR


# First encfs run
res=`mount -l | grep $REPO_DIR`
if [ -z "$res" ]; then
    echo "Mounting encfs repo";
    sudo encfs $REPO_ENC_DIR $REPO_DIR;
else
    echo "encfs directory already mounted";
fi


# First docker run
res=`sudo docker ps| grep $REPO_NAME`;
if [-z "$res" ]; then
    echo "There is a running instance of $REPO_NAME";
else
    echo "There is no running instance of $REPO_NAME"
    res2=`sudo docker ps -a | grep $REPO_NAME`;
    if [ -z "$res2" ]; then
       echo "There is no stopped instance of $REPO_NAME"
    else
       echo "Deleting old instance of $REPO_NAME";
       sudo docker rm $REPO_NAME;
    fi
    echo "Running docker";
    sudo docker run -it --rm --name $REPO_NAME --hostname  $REPO_NAME -v $REPO_DIR:/home/user/Dropbox -v $REPO_CLOUDDATA_DIR:/home/user/.dropbox ghosty-dropbox
fi


