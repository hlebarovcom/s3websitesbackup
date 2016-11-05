#!/bin/bash

# Header
echo -e "|Hlebarov.com S3 Files Backup Script v.0.1 |"
echo -e "|(cc) hlebarov 2016|"

# Define a couple of variables
stamp=`date +"%s-%Y-%m-%d-%H%M%S"`

# Where the root of your websites is?
runfolder="/home"

# Where to store temporary files
tempfolder="/tmp"

# Bucket name
bucket="s3://BUCKETNAME"

# if using a subfolder in the bucket use this variable
bucketfolder="/FOLDER"

# Create zips from all public_html folders in the home folder
cd $runfolder
for f in *; do
    if [ -d ${f} ]; then

	  # Define our filenames
	  filename="$stamp-$f.zip"
	  tmpfile="$tempfolder/$filename"
	  object="$bucket$bucketfolder/$stamp/$filename"
	
	  # Feedback
	  echo -e "Taking on $f..."
	  
	  # Tar and zip
	  echo -e "... creating $tmpfile ..."
	  tar -czf $tmpfile $f/public_html
	  
	  # Upload
	  echo -e ".. uploading $f ..."
	  s3cmd put "$tmpfile" "$object"
	  
	  # Delete
	  rm -f "$tmpfile"

    fi
done