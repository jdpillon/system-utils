#!/bin/sh


# Usage : ./importEvolution.sh user old_user_dir_path
# Simply copy .local/share/evolution, .gconf/apps/evolution and .config/evolution
# from old_user_dir_path to new user's home dir


USER=$1
OLDPATH="$2/$USER"

if [[ -z $OLDPATH ]]; then 
  echo "Usage : ./importEvolution.sh old_user_dir_path user"
  exit 254
else
  if [[ -z $USER ]]; then 
    echo "Usage : ./importEvolution.sh old_user_dir_path user"
    exit 255
  fi
fi

USERPATH=`eval echo -n ~$USER`
if [[ "$USERPATH" == "~$USER" ]]; then
  echo "The user $USER does not exist !"
  exit 253
fi


echo "Copying evolution data from $OLDPATH to $USERPATH :"

EVOLUTIONDATA=".local/share .gconf/apps .config"

for path in $EVOLUTIONDATA ; do
  FULLPATH="$OLDPATH/$path/evolution"
  echo "$FULLPATH => $USERPATH/$path"
  echo "cp -Rfp $FULLPATH $USERPATH/$path"
done

