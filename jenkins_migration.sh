#!/bin/bash

# Variables

SOURCE_USER="alpha"
TARGET_USER="alpha"
TARGET_IP="10.1.0.148"
SOURCE_JENKINS_HOME="/var/lib/jenkins"  # Adjust this path according to your Jenkins home directory
BACKUP_JENKINS_FILENAME="jenkins_backup.tar.gz"
TARGET_JENKINS_HOME="/var/lib/jenkins"  # Adjust this path according to your Jenkins home directory on the new server
BACKUP_DIR="/datadrive/cloned_backup"
TARGET_DIR="/datadrive/cloned_backup"
SSH_DIR="/home/alpha/.ssh/id_rsa"

# Create a backup of Jenkins home directory
echo "Creating backup of Jenkins home directory..."
cd $BACKUP_DIR
tar -czvf $BACKUP_JENKINS_FILENAME $SOURCE_JENKINS_HOME

# Transfer backup to the target server
echo "Copying backup to the target server..."
scp $BACKUP_JENKINS_FILENAME $TARGET_SERVER:$BACKUP_DIR

scp -i ${SSH_DIR} "${BACKUP_DIR}/BACKUP_JENKINS_FILENAME" "${TARGET_USER}@${TARGET_IP}:${TARGET_DIR}/"

# SSH into the target server and perform the migration steps
echo "Logging into the target server..."



remote_execute() {
    local USER=$1
    local HOST=$2
    local CMD=$3
    ssh -i ${SSH_DIR} "${USER}@${HOST}" "${CMD}"
}


remote_execute $TARGET_USER $TARGET_IP "
   
   
	# Extract backup on the target server
	echo "Extracting backup on the target server..."
	tar -xzvf /$BACKUP_DIR/$BACKUP_JENKINS_FILENAME -C $TARGET_JENKINS_HOME



	# Adjust permissions on Jenkins home directory
	echo "Adjusting permissions..."
	chown -R jenkins:jenkins $TARGET_JENKINS_HOME

	# Start Jenkins service
	echo "Starting Jenkins service..."
	systemctl start jenkins

	# Clean up temporary files
	echo "Cleaning up..."
	rm /$BACKUP_DIR/$BACKUP_JENKINS_FILENAME


	echo "Jenkins migration completed."
"




check_service_status() {
    systemctl is-active --quiet "$1"
}



        if check_service_status "$service"; then
            echo "$service started successfully."
        else
            echo "Failed to start $service. Exiting."
            exit 1
        fi
