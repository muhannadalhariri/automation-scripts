# Database Backup Script with S3 Upload

This script is designed to automate the process of backing up a MySQL database and uploading the backup file to an Amazon S3 bucket. After successfully uploading the backup, the script deletes the local backup file to save storage space.

## Prerequisites

Before using this script, ensure the following:

1. **MySQL Client**: The `mysqldump` command should be available on the system where this script will run.
2. **AWS CLI**: The AWS CLI should be installed and configured with the necessary permissions to upload files to your S3 bucket.

## Usage

1. **Clone the Repository**: 
   Clone this repository or download the script to your local machine.

2. **Modify the Script**: 
   Open the script file and replace the placeholder values with your actual credentials and parameters.

   ```bash
   DB_USER="your_db_username"
   DB_PASSWORD="your_db_password"
   DB_NAME="your_db_name"
   S3_BUCKET="your_s3_bucket_name"
   S3_PREFIX="your_s3_prefix"

