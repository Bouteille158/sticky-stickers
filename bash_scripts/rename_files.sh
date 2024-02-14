#!/bin/bash

# Function to get parent folder names
get_parent_names() {
    local path=$1
    local parent_names=""
    
    # Extract parent folder names
    while [ "$path" != "." ]; do
        parent_folder=$(basename "$path")
        parent_names="$parent_folder-$parent_names"
        path=$(dirname "$path")
    done
    
    echo "$parent_names"
}

# Iterate through all subdirectories up to three levels
find . -type d -mindepth 1 -maxdepth 3 | while read -r dir; do
    echo "Processing files in directory: $dir"
    
    # Iterate through files in the subdirectory
    for file in "$dir"/*; do
        # Check if the file is a regular file
        if [ -f "$file" ]; then
            # Get the current filename
            filename=$(basename "$file")
            
            # Get parent folder names
            parent_names=$(get_parent_names "$dir")
            
            # Rename the file with parent folder names and current filename
            new_filename="$parent_names$filename"
            
            # Rename the file
            mv "$file" "$dir/$new_filename"
            
            echo "Renamed: $file to $new_filename"
        fi
    done
done

echo "Renaming complete!"

