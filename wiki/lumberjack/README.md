# Lumberjack
This is a tool that logs player transaction data for review by administrators. 

## Features
- Compiles information useful for discovering the exploitation of some key systems by end users.
- Logs information to files on the server to plain text files, in csv format, for ease of use with spreadsheets, etc.
- Settings are configurable in bin/conf/config.lua

## Settings
- LumberjackTips: Value of 0 will disable. Sales values <= this amount will be logged.
- LumberjackBazaar: Value of 0 will disable. Sales values <= this amount will be logged.
- LumberjackVendor: Value of 0 will disable. Sales values <= this amount will be logged.
- LumberjackDeleted: 0 Disables logging of deleted characters.
- LumberjackTXT: 0 Disables logging to text files.
- LumberjackSQL: 0 Disables logging to an exteral database.

## Text Log Usage
The following files are generated in bin/log/lumberjack/  

**banktips.log  
tips.log  
bazaarsales.log  
vendorsales.log  
deletedcharacters.log**  

You will find examples of each in this wiki directory. All files share the same pattern of data output, but some files have more or less data than others.  

The file **lumberjack_examples.ods** in this wiki directory is a quick example of how you can view the data in a spreadsheet. The file was created using LibreOffice 5. When using LibreOffice, it is easiest to open each log file with LibreOffice, as that will always prompt you to import the data as comma separated values (where as it doesn't always prompt when copy/pasting the data into a sheet). This will allow you to then copy/paste all the data from the spreadsheet it opens to your own custom spreadsheet you have saved elsewhere.  

**Steps:**
  
1. Open your spreadsheet program.  
2. Open a log file, choose comma separated values (csv) format.  
3. Select all the data and copy it.  
4. Open your super uber spreadsheet with lots of sorting rules, etc. and paste the data into it.  

## Text Log Archiving
A Bash script has been included that will automatically archive the Core3 log files to a remote Secure FTP (sftp) server. It requires that sftp and sshpass be installed on the server (sudo apt-get install sftp sshpass). Here is how you use the script...

1. Copy archivelogs.sh script from this directory to ~/bin/archivelog.sh
2. Create a "cron job" that runs it on the first day of the month. Open the Cron editor typing "crontab -e" in a terminal, cursor down to the end of the file and the following:  

0 0 1 * * ~/bin/archivelog.sh  

3. Create a directory on the root of your FTP server for the log files, such as "logs".
4. Fill in the configuration values inside ~/bin/archivelog.sh, like so

LOGDIR="/home/swgemu/workspace/Core3/MMOCoreORB/bin/log"  
HOST="192.168.1.100"  
USER="greedo"  
PORTNUMBER=22  
PASSWORD="password"  
REMOTELOGDIR="logs"  
FILENAME="sever_logs_"  

**Descriptions:**

- **LOGDIR:** Path to the log dir on your server 
- **HOST:** SFTP server address/url
- **USER:** SFTP server user name
- **PORTNUMBER:** SFTP server port number  
- **PASSWORD:** SFTP server user password 
- **REMOTELOGDIR:** Log directory name  
- **FILENAME:** Beginning of the archive file name   

## SQL Usage
This feature may be developed at a later date.
