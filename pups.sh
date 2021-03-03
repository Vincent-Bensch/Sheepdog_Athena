#!/bin/bash

sudo apt-get update
sudo apt install default-jre -y
sudo apt install tmux -y
sudo apt install nvidia-headless-460 -y
sudo apt install x11-xserver-utils -y

sudo rmdir rm -r -f sheep
sudo mkdir sheep

sudo wget --no-check-certificate --content-disposition --no-cache https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog/master/launch.sh -O sheep/launch.sh