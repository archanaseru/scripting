#!/bin/bash

# Path to the passwd file
passwd_file="/etc/passwd"

# Base directory where user home directories are located
base_dir="/home"

# Read each line from the passwd file
while IFS=: read -r username password uid gid gecos home shell; do
    # Construct full path of the user's home directory
    user_home="$base_dir/$username"

    # Check if the user's home directory exists
    if [ -d "$user_home" ]; then
        echo "Changing ownership for user: $username"

        # Change ownership of the user's home directory
        chown -R "$username":"$(id -gn "$username")" "$user_home"

        echo "Ownership updated for $user_home"
        echo
    fi
done < "$passwd_file"
