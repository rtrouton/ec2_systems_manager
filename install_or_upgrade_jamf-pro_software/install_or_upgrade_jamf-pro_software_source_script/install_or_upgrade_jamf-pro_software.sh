#!/bin/bash

# This script downloads a Jamf Pro installer from an S3
# bucket and installs it. This will either install a new
# copy of Jamf Pro or upgrade an existing copy.

# Create directory to download latest Jamf Pro installer

jamfpro_download_directory="/jamfpro-download"

if [[ ! -d  "$jamfpro_download_directory" ]]; then
    /usr/bin/mkdir -p "$jamfpro_download_directory"
fi

# Get applicable AWS region from EC2 instance that the script is running on.

aws_region=$(/bin/curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed "s/.$//g")

# Set identity of the S3 bucket based on the AWS region

if [[ "$aws_region" = "eu-central-1" ]]; then
   s3_bucket=s3-bucket-name-goes-here
elif [[ "$aws_region" = "eu-west-1" ]]; then
   s3_bucket=s3-bucket-name-goes-here
elif [[ "$aws_region" = "us-east-1" ]]; then
   s3_bucket=s3-bucket-name-goes-here
fi

# Copy the Jamf Pro installer from the appropriate S3 bucket to the download directory

/bin/aws s3 sync --delete s3://"$s3_bucket"/ "$jamfpro_download_directory" --region "$aws_region"

# Unzip the Jamf Pro installer

if [[ -f "$jamfpro_download_directory"/latest_jamfpro_installer_goes_here.zip ]]; then
    unzip "$jamfpro_download_directory"/latest_jamfpro_installer_goes_here.zip -d "$jamfpro_download_directory"
fi

# Remove the downloaded .zip file

if [[ -f "$jamfpro_download_directory"/latest_jamfpro_installer_goes_here.zip ]]; then
    rm "$jamfpro_download_directory"/latest_jamfpro_installer_goes_here.zip
fi


# Locate the Jamf Pro installer .run file

if [[ -e "$(/usr/bin/find $jamfpro_download_directory -maxdepth 3 \( -iname \*jssinstaller*\.run \))" ]]; then
      installer_path="$(/usr/bin/find $jamfpro_download_directory -maxdepth 3 \( -iname \*jssinstaller*\.run \))"
elif [[ -e "$(/usr/bin/find $jamfpro_download_directory -maxdepth 3 \( -iname \*jamfproinstaller*\.run \))" ]]; then
      installer_path="$(/usr/bin/find $jamfpro_download_directory -maxdepth 3 \( -iname \*jamfproinstaller*\.run \))"
fi

# Stop existing copy of Jamf Pro if it is running

service jamf.tomcat8 stop

# Install Jamf Pro

if [[ ! -z "$installer_path" ]]; then
   yes | "$installer_path"
fi