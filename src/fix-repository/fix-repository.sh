#!/bin/bash
KEY=4B758E0A1A2F4146B53E97F6980CD593E882D694
NAME=lunitely

gpg --keyserver keyserver.ubuntu.com --recv-keys $KEY
gpg --output /tmp/$NAME.gpg --armor --export $KEY
echo "$KEY:6" > /tmp/$NAME.txt
gpg --import-ownertrust /tmp/$NAME.txt

cp /tmp/$NAME.gpg /usr/share/pacman/keyrings/

pacman-key --init
pacman-key --recv-keys $KEY
pacman-key --add /tmp/$NAME.gpg
pacman-key --finger $KEY
pacman-key --lsign-key $KEY
pacman-key --init
pacman-key --populate $NAME

rm /tmp/$NAME.gpg
rm /tmp/$NAME.txt