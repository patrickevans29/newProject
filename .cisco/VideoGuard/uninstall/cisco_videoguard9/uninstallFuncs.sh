#!/bin/bash

# param - auto | manual (auto - from launchd)

uninstallDir=$HOME/.cisco/VideoGuard/uninstall/cisco_videoguard9

unloadServer()
{
    launchctl unload -S Aqua $HOME/Library/LaunchAgents/com.cisco.videoguard9.plist
    if [ "$1" != "auto" ]
    then
        launchctl unload -S Aqua $HOME/Library/LaunchAgents/com.cisco.videoguard9.uninstall.plist
    fi
}

unloadMonitor()
{
	launchctl unload -S Aqua $HOME/Library/LaunchAgents/com.cisco.videoguardmonitor.plist
}

removeMonitor()
{
	rm -rf $HOME/Library/LaunchAgents/com.cisco.videoguardmonitor.plist > /dev/null 2>&1
	rm -rf $HOME/Library/Cisco/VideoGuardPlayer/VideoGuardMonitor

	if ! ls $HOME/Library/Cisco/VideoGuardPlayer/VideoGuard* > /dev/null 2>&1;
	then
		rm -rf $HOME/Library/Cisco/VideoGuardPlayer
		filesCount=`ls $HOME/Library/Cisco/* 2> /dev/null | wc -l`
        if [ $filesCount -eq 0 ];
        then
            rm -rf $HOME/Library/Cisco
        fi
	fi
}

removeServer()
{
	rm -rf $HOME/Library/LaunchAgents/com.cisco.videoguard9.plist > /dev/null 2>&1
	rm -rf $HOME/Library/LaunchAgents/com.cisco.videoguard9.uninstall.plist > /dev/null 2>&1

	rm -rf $HOME/Library/Cisco/VideoGuardPlayer/VideoGuard9

	rm -f $uninstallDir/uninstall.sh
	rm -f $uninstallDir/uninstallFuncs.sh
	rm -f $uninstallDir/condUninstall.sh

	if [ -O $uninstallDir ]
	then
		rm -rf $uninstallDir
	fi
}

isNoMoreServers()
{
	flag=1
	cd $HOME/Library/Cisco/VideoGuardPlayer
	if [ `ls | grep VideoGuard\[0-9\] | wc -l` -eq 0 ]; then
		flag=0
	fi
	return $flag
}
