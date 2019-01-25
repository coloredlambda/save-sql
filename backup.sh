#! /bin/sh

# Credentials to run database backup
DATABASE_USERNAME="root"
DATABASE_PASSWORD="pineapple"
DATABASE_NAME="test"
REMOTE_URL="http://localhost:8080/api/v1/backup"

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

# After backup is done running, compressing the backup file
tar -czvf backup.tar.gz backup.sql

# Checking exit status of compression command
if [ $? -eq 0 ]
    then
        echo "Backup compressed"
    else
        echo "Backup failed to compress"
        exit
fi

# Transmitting file over network
curl -v -F backup=@backup.tar.gz $REMOTE_URL

# Checking exit status of compression command
if [ $? -eq 0 ]
    then
        echo "File sent"
    else
        echo "Ooops file failed to send over network"
        exit
fi