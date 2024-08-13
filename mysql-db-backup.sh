#!/bin/bash

# Database credentials
DB_USER="your_db_username"
DB_PASSWORD="your_db_password"
DB_NAME="your_db_name"

# Backup directory and filename
BACKUP_DIR="backup/"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql"

# S3 bucket and prefix
S3_BUCKET="your_s3_bucket_name"
S3_PREFIX="your_s3_prefix"

# Command to backup the database
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME --host=127.0.0.1 --column-statistics=0 > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Database backup completed successfully. File: $BACKUP_FILE"
else
  echo "Error: Database backup failed."
  exit 1
fi

# AWS CLI command to upload the backup to S3
aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/$S3_PREFIX/

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "Backup upload to S3 completed successfully."
  # Delete the local backup file
  rm $BACKUP_FILE
  if [ $? -eq 0 ]; then
    echo "Local backup file deleted successfully."
  else
