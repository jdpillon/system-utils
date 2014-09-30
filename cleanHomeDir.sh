#!/bin/sh
DOIT=false
ROOT_DIR="/tmp"
MAINGROUP="marcouville"
OLD_DIR_BASE="$ROOT_DIR/home/.old"
KEEP_FOLDERS=".evolution .mozilla .thunderbird"
SKEL_FILES="/etc/skel/.bash_logout /etc/skel/.bashrc /etc/skel/.profile"
SECONDARY_GROUPS="audio,cdrom,dip,plugdev,fuse,pulse-access,sambashare,x2gouser,x2godesktopsharing"


for user in `./userList.sh` ; do
  echo ""
	echo "########################## Utilisateur : $user #########################"
  echo "Add $user to new primary group and secondary groups : "
  echo "usermod -g $MAINGROUP -G $SECONDARY_GROUPS $user"
  if $DOIT ; then
    usermod -g $MAINGROUP -G $SECONDARY_GROUPS $user
  fi


	old=$OLD_DIR_BASE/$user
	echo "old home dir : $old"
	new="$ROOT_DIR/home/$user"
	echo "new home dir : $new"
  if [ ! -e $new ] ; then
    echo "Create new home dir for user $user : "
    echo "mkdir $new"
    echo "chown $user:$MAINGROUP $new"
    if $DOIT ; then
      mkdir $new
      chowm $user:$MAINGROUP $new
    fi
  fi



  echo "Skel files : "
  for f in $SKEL_FILES ; do
    echo "Copy $f to $new"
    echo "cp $f $new"
    if $DOIT ; then
      cp $f $new
    fi
  done
	for d in $KEEP_FOLDERS ; do
		if [ -e $old/$d ] ; then
			echo "Restoring $d"
			echo "cp -Rf $old/$d $new"
      if $DOIT ; then
        cp -Rf $old/$d $new
      fi
		else
			echo "$d is not here !"
		fi
	done

  echo "Restoring $user's DATA"
  echo "mv $old/* $new"
  echo "chown $user:$MAINGROUP $new"
  if $DOIT ; then
    mv $old/* $new
    chown -R $user:$MAINGROUP $new
  fi
  
done
