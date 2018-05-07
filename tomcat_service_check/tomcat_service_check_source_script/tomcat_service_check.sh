#!/bin/bash

# This script is designed for use with EC2 Systems Manager's
# State Manager. It does the following tasks:
#
# 1. Check to see if /root/.TomcatMonitoringActive is present.
# 2. If /root/.TomcatMonitoringActive is present, run the
#    following tasks:
#
#    A. Check to see if the Tomcat service is active on port 8080
#    B. If the Tomcat service is active, print a message and exit.
#    C. If the Tomcat service is not active, print an error message
#       and take the following actions:
#       i. Restart the Tomcat service
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

 echo "Tomcat port monitoring is active."

  # Check for Tomcat to be running on port 8080
  PORTCHECK=$(/bin/netstat -tln | awk '/:8080/ {print $4}' | sed "s/://g")

  if [[ "$PORTCHECK" = "8080" ]]; then
      echo "Tomcat service is running on port $PORTCHECK"
  else
      echo "Tomcat service is not responding on port 8080"
      echo "Restarting Tomcat service"

      # Starts the JAMF Tomcat processes

      service jamf.tomcat8 restart
  fi
else
 echo "Tomcat port monitoring is offline."
fi

exit $ERROR