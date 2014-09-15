#!/bin/sh

# Tentative de supression du message pulse audio en utilisant x2go
# [pulseaudio] main.c: User-configured server at localhost:30008, refusing to start/autospawn.


for user in `./userList.sh`
do
  cat $user/.pulse

done
