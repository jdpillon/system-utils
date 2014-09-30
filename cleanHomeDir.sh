#!/bin/sh
ROOT_DIR="/tmp"
OLD_DIR_BASE="$ROOT_DIR/home/.old"
KEEP_FOLDERS=".evolution .mozilla .thunderbird"
SKEL_FILES="/etc/skel/.bash_logout /etc/skel/.bashrc /etc/skel/.profile"
MAINGROUP="marcouville"

for user in `./userList.sh` ; do
	echo "Utilisateur : $user"
	old=$OLD_DIR_BASE/$user
	echo "	old home dir : $old"
	new="$ROOT_DIR/home/$user"
	echo "	new home dir : $new"
  echo "  Skel files : "
  for f in $SKEL_FILES ; do
    echo "        Copy $f to $new"
  done
	for d in $KEEP_FOLDERS ; do
		if [ -e $old/$d ] ; then
			echo "		Restoring $d"
		else
			echo "		$d is not here !"
		fi
	done
  
  id

  su $user -c /bin/sh - << EOF
  groups
EOF




done
