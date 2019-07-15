#!/bin/bash
# get the secure.img password
PASS="$(lpass show secure.img --notes)"
echo -n "$PASS" | sudo cryptsetup luksOpen --key-file - secure.img dsteen_secure
sudo mount /dev/mapper/dsteen_secure /home/dsteen/secure
sudo mount -o bind /home/dsteen/secure/.ssh /home/dsteen/.ssh

