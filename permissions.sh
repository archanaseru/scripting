#!/bin/bash

home_dir="/home"

for user_dir in "$home_dir"/*; do
    # Check if it's a directory
    if [ -d "$user_dir" ]; then
        echo "User: $(basename "$user_dir")"
        echo "--------------------"

        for folder in "$user_dir"/*/; do
            # Extract folder name and permissions
            folder_name=$(basename "$folder")
            permissions=$(stat -c "%A" "$folder")

            # Output folder name and permissions
            echo "$folder_name - $permissions"
            
           sudo chown $permissions:$permissions $folder_name
        done

        # List all directories inside the user's home directory
        
        echo
    fi
done
