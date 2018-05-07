This EC2 Systems Manager document is designed for use with EC2 Systems Manager's
State Manager. It performs the following tasks:

1. Check to see if `/root/.TomcatMonitoringActive` is present.
2. If `/root/.TomcatMonitoringActive` is present, run the 
   following tasks:
    
   A. Check to see if the Jamf Pro Tomcat service is active on port 8080
   
   B. If the Jamf Pro Tomcat service is active, print a message and exit.
   
   C. If the Jamf Pro Tomcat service is not active, print an error message.
      
   D. Restart the Jamf Pro Tomcat service

The reason for the file check for `/root/.TomcatMonitoringActive` is to allow Tomcat monitoring to be easily disabled for times when it would not be convenient for the automated Tomcat service restart to be active, like when performing upgrades to the Tomcat
application or when the Tomcat application needs to be offline 
for maintenance reasons.

The source script for the EC2 Systems Manager document is available in `tomcat_service_check_source_script`.

To enable and disable the Jamf Pro Tomcat service check, please see the following EC2 Systems Manager document located elsewhere in this repo:

* `tomcat_service_check_disable`
* `tomcat_service_check_enable`