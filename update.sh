#! /bin/bash
# Original script Copyright (c) 2009 Ryan Duff <http://ryanduff.net>
# This script is licensed under GNU GPL version 2.0 or above
#
# This script upgrades (switches) a subversion copy of WordPress
# to a tagged version of your choice.
# List of Current WordPress tag versions can be found at
# <http://core.trac.wordpress.org/browser/tags>
#
# This script was found here:
# <http://fusionized.com/2010/10/bash-script-to-upgrade-multiple-subversion-copies-of-wordpress/>
#
# To find your wp instances:
# (uiserver):u35609748:~ > find . -name wp-config.php

# Set your paths
paths=(/full-path-to-instance1/
/full-path-to-instance2/)

echo ------------------------
echo WordPress Update Script
echo ------------------------
echo
echo here are the last three versions
svn ls http://core.svn.wordpress.org/tags/ | tail -n3
echo -n "Please enter version number and press [ENTER]: "
read version

for path in ${paths[@]}
do
cd $path
echo
echo
echo -n "Updating $path"
echo
svn sw http://core.svn.wordpress.org/tags/$version/ .
echo
echo -n "Update of $path complete."
echo
done
