#!/bin/bash

home_dir="/home"

for user_dir in "$home_dir"/*; do
    # Check if it's a directory
    if [ -d "$user_dir" ]; then
        echo "User: $(basename "$user_dir")"
        echo "--------------------"
        # List all directories inside the user's home directory
        sudo chown $user_dir:$user_dir $user_dir
        echo
    fi
done
