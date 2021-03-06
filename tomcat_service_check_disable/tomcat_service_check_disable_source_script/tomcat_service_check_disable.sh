#!/bin/bash

# This script is designed for use with EC2 Systems Manager's
# State Manager. It does the following tasks:
#
# 1. Check to see if /root/.TomcatMonitoringActive is present.
# 2. If /root/.TomcatMonitoringActive is present, remove file.
#
# The reason for the file check for /root/.TomcatMonitoringActive
# is to allow Tomcat monitoring to be easily disabled for times
# when it would not be convenient for the automated Tomcat service
# restart to be active, like when performing upgrades to the Tomcat
# application or when the Tomcat application needs to be offline
# for maintenance reasons.

# Check for /root/.TomcatMonitoringActive

MONITORCHECK="/root/.TomcatMonitoringActive"

ERROR=0

if [[ -f "$MONITORCHECK" ]]; then

 echo "$MONITORCHECK is present. Tomcat port monitoring is active."
 echo "Removing $MONITORCHECK to disable Tomcat port monitoring."
 rm "$MONITORCHECK"
else
 echo "$MONITORCHECK not found. Tomcat port monitoring is not active."
fi

exit $ERROR