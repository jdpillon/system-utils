#!/bin/sh

for user in `./userList.sh`;do
  echo "$user"
  echo "slay $user"
  ./copyEvolution.sh $user /home/.old
done
