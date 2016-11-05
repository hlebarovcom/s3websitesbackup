# s3filesbackup
A very simple way to backup all your websites (usually located at public_html folders) to Amazon S3 bucket.

## 1 - Install s3cmd
*Below you can find how to install it on Ubuntu 14.04.1. See http://s3tools.org/repositories for other systems*

    # Install s3cmd
    apt-get update
    apt-get install s3cmd
    # Setup s3cmd
    s3cmd --configure
    # Setup your AWS account credentials when asked

## 2 - Add your script
Upload a edited copy of [s3websitesbackup.sh](s3websitesbackup.sh)

Next you have to make it executable.

    chmod +x s3websitesbackup.sh

Run the script to make sure it runs fine

    ./s3websitesbackup.sh

## 3 - Automate it with CRON
Assuming the backup script is stored in /home/youruser/s3websitesbackup.sh we need to add a crontask to run it automatically. The example below is for having the script run every day, at 6am, 12pm, 6pm. You can alter this as per your needs and frequency of backup.

    # Edit the crontab
    env EDITOR=nano crontab -e
        # Add the following lines:
        # Run the database backup script at 3am
        0 6,12,18 * * * bash /home/youruser/s3websitesbackup.sh >/dev/null 2>&1
    
## 4 - Attribution
This script has been inspired from the [Backup MySQL to Amazon S3 script](https://gist.github.com/oodavid/2206527). Check it out for great way to backup your MySQL databases easily. 