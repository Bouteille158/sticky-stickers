#!/bin/bash

# Function to remove parent folder names from the filename
remove_parent_names() {
    local filename=$1
    local new_filename
    new_filename="${filename##*-}"
    echo "$new_filename"
}

# Iterate through all subdirectories
for dir in */; do
    dir=${dir%/}  # Remove trailing slash from directory name
    echo "Processing files in directory: $dir"
    
    # Iterate through files in the subdirectory
    for file in "$dir"/*; do
        # Get the current filename
        filename=$(basename "$file")
        
        # Remove parent folder names from the filename
        new_filename=$(remove_parent_names "$filename")
        
        # Rename the file back to the original state
        mv "$file" "$dir/$new_filename"
        
        echo "Reverted: $file to $new_filename"
    done
done

echo "Reverting complete!"

