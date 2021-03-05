#!/bin/bash

echo " "
echo "-------------------Starting Sheepdog v21-------------------"
echo " "

echo "Removing logs"

sudo rm -f "/etc/sheep/APU.log"
sudo rm -f "/etc/sheep/CPU.log"
sudo rm -f "/etc/sheep/GPU.log"

echo "Closing old sessions"
sudo tmux -q kill-session -t APU
sudo tmux -q kill-session -t CPU
sudo tmux -q kill-session -t GPU

echo "Starting downloads"

sudo wget -q -O "/etc/sheep/sheepit.jar" https://www.sheepit-renderfarm.com/media/applet/client-latest.php

echo "Collected new sheepit"

sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog_Athena/master/launch.sh -O "/etc/sheep/launch.sh"
sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog/master/hydrant.sh -O "/etc/sheep/hydrant.sh"
sudo wget -q --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog_Athena/master/bark_APU.sh -O "/etc/sheep/bark_APU.sh"

echo "Refreshed command files"

source "/etc/sheep/hydrant.sh"

echo "Loaded username"

echo " "
echo "Logging in as: $TAIL_USERNAME"
echo " "

sudo tmux new-session -d -s APU "sudo bash /etc/sheep/bark_APU.sh >> /etc/sheep/APU.log"

echo "Sheepdog Out"
echo " "