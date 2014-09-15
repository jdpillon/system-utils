#!/bin/sh

for user in `userList.sh`
do
  echo $user
  sudo adduser $user $1
done

