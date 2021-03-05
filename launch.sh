#!/bin/bash

echo " "
echo "-------------------Starting Launcher v21-------------------"
echo " "

echo "Getting current sheepdog"

sudo wget -q --no-check-certificate --content-disposition --no-cache  https://raw.githubusercontent.com/Vincent-Bensch/Sheepdog_Athena/master/sheepdog.sh -O "/etc/sheep/sheepdog.sh"

echo "Calling sheepdog"

sudo bash "/etc/sheep/sheepdog.sh"