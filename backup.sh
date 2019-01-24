#! /bin/sh

# Credentials to run database backup
DATABASE_USERNAME=""
DATABASE_PASSWORD=""
DATABASE_NAME=""

echo "Starting backup"
echo "Please wait while backup is run.."


result=$(mysqldump -u $DATABASE_USERNAME -p$DATABASE_PASSWORD --all-databases > lala.sql)


if [[ result == 0 ]]
    then
        echo "Command passed"
fi