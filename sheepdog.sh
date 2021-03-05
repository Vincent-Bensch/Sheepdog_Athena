#!/bin/bash

echo " "
echo "-------------------Starting Sheepdog v20-------------------"
echo " "

echo "Removing logs"

sudo rm -f "/etc/sheep/GPU_log.txt"

echo "Closing old sessions"
sudo tmux -q kill-session -t GPU

echo "Starting downloads"

sudo wget -q -O "/etc/sheep/sheepit.jar" https://www.sheepit-renderfarm.com/media/applet/client-latest.php

echo "Collected new sheepit"

sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog_Athena/master/launch.sh -O "/etc/sheep/launch.sh"
sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog/master/hydrant.sh -O "/etc/sheep/hydrant.sh"
sudo wget -q --no-check-certificate --content-disposition --no-cachehttps://raw.githubusercontent.com/Vincent-Bensch/Sheepdog_Athena/master/bark_GPU.sh -O "/etc/sheep/bark_GPU.sh"

echo "Refreshed command files"

source "/etc/sheep/hydrant.sh"

echo "Loaded username"

echo " "
echo "Logging in as: $TAIL_USERNAME"
echo " "

sudo tmux new-session -d -s GPU "sudo bash /etc/sheep/bark_GPU.sh"

echo "Sheepdog Out"
echo " "