This script is designed for use with EC2 Systems Manager's
State Manager. It does the following tasks:

1. Check to see if `/root/.TomcatMonitoringActive` is present.
2. If `/root/.TomcatMonitoringActive` is present, run the 
   following tasks:
    
   A. Check to see if the Jamf Pro Tomcat service is active on port 8080.
   
   B. If the Jamf Pro Tomcat service is active, print a message and exit.
   
   C. If the Jamf Pro Tomcat service is not active, print an error message.
      
   D. Restart the Jamf Pro Tomcat service.

The reason for the file check for `/root/.TomcatMonitoringActive`
is to allow Tomcat monitoring to be easily disabled for times
when it would not be convenient for the automated Jamf Pro Tomcat service
restart to be active, like when performing upgrades to the Tomcat
application or when the Tomcat application needs to be offline 
for maintenance reasons.