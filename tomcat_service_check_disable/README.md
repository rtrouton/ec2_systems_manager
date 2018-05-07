This EC2 Systems Manager document is designed to perform the following tasks:

1. Check to see if `/root/.TomcatMonitoringActive` is present.
2. If `/root/.TomcatMonitoringActive` is present, remove the file.

It is designed to work with the `tomcat_service_check` EC2 Systems Manager document located elsewhere in this repo.

The reason for the file check for `/root/.TomcatMonitoringActive` is to allow Tomcat monitoring to be easily disabled for times when it would not be convenient for the automated Tomcat service restart to be active, like when performing upgrades to the Tomcat
application or when the Tomcat application needs to be offline 
for maintenance reasons.

The source script for the EC2 Systems Manager document is available in `tomcat_service_check_disable_source_script`.