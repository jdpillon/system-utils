#!/bin/sh
DST="/home/scan/scans"
for user in `userList.sh`
do
  rm /home/$user/Scans
  echo "ln -s $DST /home/$user/Scans"
  ln -s $DST /home/$user/Scans
  chown $user:louvrais /home/$user/Scans
done

