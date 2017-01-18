#!/bin/bash

REPO_NAME=$1
REPO_BASE_DIR=/home/xaled/.repos
REPO_DIR=/home/xaled/.repos/$REPO_NAME
REPO_ENC_DIR=/home/xaled/.repos/$REPO_NAME.enc
REPO_CLOUDDATA_DIR=/home/xaled/.repos/$REPO_NAME.cld


encfs $REPO_ENC_DIR $REPO_DIR
#sudo docker run -it --hostname  $REPO_NAME -v /home/user/Dropbox:$REPO_DIR -v /home/user/.dropbox:$REPO_CLOUDDATA_DIR ghosty-dropbox bash
sudo docker run -d --hostname  $REPO_NAME -v $REPO_DIR:/home/user/Dropbox -v $REPO_CLOUDDATA_DIR:/home/user/.dropbox ghosty-dropbox
