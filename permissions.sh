#!/bin/bash

home_dir="/home"

for user_dir in "$home_dir"/*; do
    # Check if it's a directory
    if [ -d "$user_dir" ]; then
        echo "User: $(basename "$user_dir")"
        echo "--------------------"
        user=$(basename "$user_dir")
        
        

        for folder in "$user_dir"/*/; do
            # Extract folder name and permissions
            folder_name=$(basename "$folder")
            permissions=$(stat -c "%A" "$folder")

            # Output folder name and permissions
            echo "$folder_name - $user"
            
           sudo chown $user:$user $folder_name
        done

        # List all directories inside the user's home directory
        
        echo
    fi
done
