#!/bin/bash

#param1 - auto | manual

. $HOME/.cisco/VideoGuard/uninstall/cisco_videoguard10/uninstallFuncs.sh

unloadServer $*
removeServer 

if  isNoMoreServers; then
	unloadMonitor
	removeMonitor
fi
