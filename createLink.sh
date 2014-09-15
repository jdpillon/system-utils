#!/bin/sh
DST="/home/scan/scans"
for user in celine CV cv2 johanne leandro louvrais nathalie pascale pierre samuel scene_et_ruban tof willy
do
  rm /home/$user/Scans
  echo "ln -s $DST /home/$user/Scans"
  ln -s $DST /home/$user/Scans
  chown $user:louvrais /home/$user/Scans
done

