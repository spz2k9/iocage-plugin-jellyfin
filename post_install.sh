#!/bin/sh

# run the Install / Update script
/usr/local/bin/jellyfin_updater

# Add the video group to the jellyfinserver user
pw group mod video -m jellyfinserver

# Enable the service
sysrc -f /etc/rc.conf jellyfinserver_enable="YES"

# Start the service
service jellyfinserver start 2>/dev/null
