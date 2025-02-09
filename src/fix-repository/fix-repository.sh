#!/bin/bash
KEY=4B758E0A1A2F4146B53E97F6980CD593E882D694
NAME=lunitely

gpg --recv-keys $KEY
gpg --output /tmp/$NAME.gpg --armor --export $KEY
gpg --import /tmp/$NAME.gpg

cp /tmp/$NAME.gpg /usr/share/pacman/keyrings/

pacman-key --recv-keys $KEY
pacman-key --add /tmp/$NAME.gpg
pacman-key --finger $KEY
pacman-key --lsign-key $KEY
pacman-key --init
pacman-key --populate $NAME

rm /tmp/$NAME.gpg