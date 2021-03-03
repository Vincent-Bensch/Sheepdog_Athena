#!/bin/bash

echo " "
echo "-------------------Starting Sheepdog v16-------------------"
echo " "

echo "Removing logs"

sudo rm -f CPU_log.txt
sudo rm -f GPU_log.txt

echo "Closing old sessions"
sudo tmux -q kill-session -t GPU

echo "Starting downloads"

sudo wget -q -O sheepit.jar https://www.sheepit-renderfarm.com/media/applet/client-latest.php

echo "Collected new sheepit"

sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog/master/launch.sh -O launch.sh
sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog/master/hydrant.sh -O hydrant.sh
sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog/master/bark_GPU.sh -O bark_GPU.sh

echo "Refreshed command files"

source hydrant.sh

echo "Loaded username"

echo " "
echo "Logging in as: $TAIL_USERNAME"
echo " "

sudo tmux new-session -d -s GPU 'sudo bash bark_GPU.sh'

echo "Sheepdog Out"
echo " "