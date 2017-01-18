#!/bin/bash

# Dirs
REPO_NAME=$1
REPO_BASE_DIR=/home/xaled/.repos
REPO_DIR=/home/xaled/.repos/$REPO_NAME
REPO_ENC_DIR=/home/xaled/.repos/$REPO_NAME.enc
REPO_CLOUDDATA_DIR=/home/xaled/.repos/$REPO_NAME.cld



mkdir -p $REPO_DIR
mkdir -p $REPO_ENC_DIR
mkdir -p $REPO_CLOUDDATA_DIR

# Build
sudo docker build -t ghosty-dropbox ./ghosty-git-docker/dropbox/


# First run encfs

encfs $REPO_ENC_DIR $REPO_DIR

# First run Dropbox
sudo docker run -it --hostname  $REPO_NAME -v $REPO_DIR:/home/user/Dropbox -v $REPO_CLOUDDATA_DIR:/home/user/.dropbox ghosty-dropbox

