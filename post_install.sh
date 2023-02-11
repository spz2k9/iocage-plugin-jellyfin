#!/bin/sh

# Configure pkg for automation
env ASSUME_ALWAYS_YES=YES pkg bootstrap

# Install the package
pkg install /tmp/jfs.pkg

# Remove the unneeded package
rm -f /tmp/jfs.pkg

# Add the video group to the jellyfinserver user
pw group mod video -m jellyfinserver

# Enable the service
sysrc -f /etc/rc.conf jellyfinserver_enable="YES"

# Start the service
service emby-server start 2>/dev/null
