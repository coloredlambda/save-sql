#! /bin/sh

# Credentials to run database backup
DATABASE_USERNAME="root"
DATABASE_PASSWORD="pineapple"
DATABASE_NAME="test"
REMOTE_URL=""

echo "Starting backup"
echo "Please wait while backup is run.."

# Running backup command with mysqldump utility
mysqldump -u $DATABASE_USERNAME -p$DATABASE_PASSWORD --all-databases > backup.sql

# Checking exit status of backup command
if [ $? -eq 0 ]
    then
        echo "Database backup executed successfully"
    else
        echo "Database backup failed to execute"    
fi