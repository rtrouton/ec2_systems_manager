#!/bin/bash

# Services Restarter - Restarts the Jamf Tomcat installation

# Stop the Jamf Tomcat processes

service jamf.tomcat8 stop

# Wait 10 seconds for Tomcat process to fully stop

sleep 10

# Starts the JAMF Tomcat processes

service jamf.tomcat8 start