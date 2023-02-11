#!/bin/sh

# Download the lffmpeg script file
fetch -o /usr/local/bin/lffmpeg https://github.com/spz2k9/jellyfin-server-freebsd/blob/hw_decode_script/script/lffmpeg

# Set ffmpeg script executable
chmod +x /usr/local/bin/lffmpeg

# Configure pkg for automation
env ASSUME_ALWAYS_YES=YES pkg bootstrap

# Download the package
fetch -o /tmp/jfs.pkg https://github.com/Thefrank/jellyfin-server-freebsd/releases/download/v10.8.9/jellyfinserver-10.8.9.pkg

# Install the package
pkg -y install /tmp/jfs.pkg

# Remove the unneeded package
rm -f /tmp/jfs.pkg

# Add the video group to the jellyfinserver user
pw group mod video -m jellyfinserver

# Enable the service
sysrc -f /etc/rc.conf jellyfinserver_enable="YES"

# Start the service
service emby-server start 2>/dev/null
