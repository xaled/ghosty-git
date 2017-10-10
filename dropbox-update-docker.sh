#!/bin/bash

#TODO: stop other ghostygit dockers
sudo depot-stop &&
sudo ./dropbox-build-docker.sh &&
sudo depot-start;
