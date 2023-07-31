#!/bin/bash

uninstallDir=$HOME/.cisco/VideoGuard/uninstall/cisco_videoguard9

. $uninstallDir/uninstallFuncs.sh

if [ ! -d $HOME/Library/Cisco/VideoGuardPlayer/VideoGuard9 -o ! -d $HOME/Library/Cisco/VideoGuardPlayer/VideoGuardMonitor ]; then
	$uninstallDir/uninstall.sh auto
fi
