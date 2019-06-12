#!/bin/bash
export shellPath=`pwd`

if [ -f /etc/apt/sources.list ]; then
    sudo mv /etc/apt/sources.list  /etc/apt/sources.list.bak
fi
system_var=`lsb_release -c`
echo ${system_var:0-9}

a=$( expr system_var : '.*\([0-9]\{8\}\).*' )
if [ -f $shellPath/src/bionic.list ]; then
    sudo cp $shellPath/src/bionic.list /etc/apt/sources.list
fi

sudo apt update
sudo apt upgrade -y
sudo apt install -y git