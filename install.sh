#!/bin/bash

sudo apt purge wine -y
sudo apt purge wine* -y
sudo apt purge winetricks -y
sudo apt purge wine:i386 -y

sudo dpkg --add-architecture i386 -y
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -

sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main' -y

sudo apt-get update -y
sudo apt-get install --install-recommends winehq-stable -y

wine --version

cd ~/Downloads
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks

chmod +x winetricks

WINEPREFIX=~/.wine wineboot -u WINEARCH=win64 WINEPREFIX=~/.wine winetricks fontsmooth=rgb gdiplus vcrun2008 vcrun2010 vcrun2012 vcrun2013 vcrun2015 atmlib msxml3 msxml6 gdiplus corefonts

exit
