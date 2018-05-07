This script is designed to do the following:

1. Download a **.zip** file with a Jamf Pro installer from an S3 bucket
2. Unzip the Jamf Pro installer
3. Non-interactively installs the Jamf Pro installer. 

This process will either install a new copy of Jamf Pro or upgrade an existing copy.

Note: This process assumes the following:

* An appropriate S3 bucket is defined in the script
* The name of the **.zip** file is defined in the script.
* Read-only access to the specified S3 bucket is available when the script is run.