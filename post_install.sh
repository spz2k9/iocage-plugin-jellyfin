#!/bin/sh

# run the Install / Update script
pkg install -y ffmpeg jellyfin libva-intel-media-driver

# Add the video group to the jellyfinserver user
pw group mod video -m jellyfin

# Enable the service
sysrc -f /etc/rc.conf jellyfin_enable="YES"

# Start the service
service jellyfin start 2>/dev/null
