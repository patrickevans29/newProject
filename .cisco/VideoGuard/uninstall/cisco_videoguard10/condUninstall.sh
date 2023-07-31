#!/bin/bash

uninstallDir=$HOME/.cisco/VideoGuard/uninstall/cisco_videoguard10

. $uninstallDir/uninstallFuncs.sh

if [ ! -d $HOME/Library/Cisco/VideoGuardPlayer/VideoGuard10 -o ! -d $HOME/Library/Cisco/VideoGuardPlayer/VideoGuardMonitor ]; then
	$uninstallDir/uninstall.sh auto
fi
