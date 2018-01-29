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
echo "encfs pass:"
read -s PASS

REPO_BASE_DIR=/home/$USER/.repos
REPO_DIR=/home/$USER/.repos/$REPO_NAME
REPO_ENC_DIR=/home/$USER/.repos/$REPO_NAME.enc
REPO_CLOUDDATA_DIR=/home/$USER/.repos/$REPO_NAME.cld


res=`mount -l | grep $REPO_DIR`
if [ -z "$res" ]; then
    echo "Mounting encfs repo";
    echo $PASS | su $USER -c "encfs \"$REPO_ENC_DIR\" \"$REPO_DIR\"";
else
    echo "encfs directory already mounted";
fi

res=`mount -l | grep $REPO_DIR`
if [ -z "$res" ]; then
    echo "Error: encfs drive is not mounted!";
    exit 2;
fi

#res=`docker ps| grep $REPO_NAME`;
#if [ -z "$res" ]; then
#    echo "There is no running instance of $REPO_NAME";
#    res2=`docker ps -a | grep $REPO_NAME`;
#    if [ -z "$res2" ]; then
#       echo "There is no stopped instance of $REPO_NAME"
#    else
#       echo "Deleting old instance of $REPO_NAME";
#       docker rm $REPO_NAME;
#    fi
#    echo "Running docker";
#    docker run -d --name $REPO_NAME --hostname  $REPO_NAME -v $REPO_ENC_DIR:/home/user/Dropbox -v $REPO_CLOUDDATA_DIR:/home/user/.dropbox ghosty-dropbox
#else
#    echo "There is a running instance of $REPO_NAME"
#fi

#docker run -d --hostname  $REPO_NAME -v $REPO_DIR:/home/user/Dropbox -v $REPO_CLOUDDATA_DIR:/home/user/.dropbox ghosty-dropbox
