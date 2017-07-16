#!/bin/bash

sudo cp rc-local.service /etc/systemd/system/ &&
sudo cp rc.local /etc/ && 
sudo systemctl enable rc-local &&
sudo systemctl start rc-local.service &&
sudo systemctl sttus rc-local.service &&
