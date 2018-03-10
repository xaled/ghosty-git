#!/bin/bash
if [ -z "$2" ]; then
    echo "need two argument: user reponame";
    exit 1;
fi

USER=$1
REPO_NAME=$2
REPO_DIR=/home/$USER/.repos/$REPO_NAME


res=`mount -l | grep $REPO_DIR`
if [ -z "$res" ]; then
    echo "encfs drive is not mounted."
else
    echo "encfs drive is mounted.";
fi

res=`docker ps| grep $REPO_NAME`;
if [ -z "$res" ]; then
    echo "There is no running instance of $REPO_NAME";
    res2=`docker ps -a | grep $REPO_NAME`;
    if [ -z "$res2" ]; then
       echo "There is no stopped instance of $REPO_NAME"
    else
       echo "There is  stopped instance of $REPO_NAME";
    fi
    echo "Could not get Sync status";
    
else
    echo "There is a running instance of $REPO_NAME"
    docker exec -it $REPO_NAME /home/user/dropbox.py status 
fi

#docker run -d --hostname  $REPO_NAME -v $REPO_DIR:/home/user/Dropbox -v $REPO_CLOUDDATA_DIR:/home/user/.dropbox ghosty-dropbox

