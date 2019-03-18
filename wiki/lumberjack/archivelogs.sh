#!/bin/bash
# Monthly log file backup and purge for SWGEmu servers
# Created By: R. Bassett Jr. (Tatwi), March 2019
#
# Requires: sftp, sshpass, a pre-made directory on your FTP server for $REMOTELOGDIR

# Configuration
LOGDIR="/home/swgemu/workspace/Core3/MMOCoreORB/bin/log"  
HOST="192.168.1.100"  
USER="greedo"  
PORTNUMBER=22  
PASSWORD="password"  
REMOTELOGDIR="logs"  
FILENAME="sever_logs_"  

set -e
FILENAME=$FILENAME$(date +"%m_%Y")".tar.gz"

# Compress files in a zip archive
echo -e "Creating archive..."
cd $LOGDIR
tar -czvf ~/$FILENAME *

# Clear sever logs
echo -e "Clearing old log files..."
find . -name '*.log' | while IFS=$'\n' read -r FILE; do
  echo "" > $FILE
done


# Upload archive file
echo -e "Uploading archive..."
cd ~/
ls
NEWDIR=$(date +"%Y_%m")

export SSHPASS=$PASSWORD
echo "mkdir ./$REMOTELOGDIR/$NEWDIR" | sshpass -e sftp -oBatchMode=no -P $PORTNUMBER -b- $USER@$HOST
echo "put $FILENAME ./$REMOTELOGDIR/$NEWDIR/" | sshpass -e sftp -oBatchMode=no -P $PORTNUMBER -b- $USER@$HOST


# Delete local log archive
echo -e "Removing temporary archive file..."
rm ~/$FILENAME

echo -e "Server log backup complete!"
