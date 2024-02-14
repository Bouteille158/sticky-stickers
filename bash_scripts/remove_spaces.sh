#!/bin/bash

# Function to replace spaces with underscores in filenames
replace_spaces() {
    local dir=$1
    
    # Iterate through files in the subdirectory
    for file in "$dir"/*; do
        # Check if the file is a regular file
        if [ -f "$file" ]; then
            # Get the current filename
            filename=$(basename "$file")
            
            # Replace spaces with underscores in the filename
            new_filename=$(echo "$filename" | tr ' ' '_')
            
            # Rename the file
            mv "$file" "$dir/$new_filename"
            
            echo "Renamed: $file to $new_filename"
        fi
    done
}

# Iterate through all subdirectories up to three levels
find . -type d -mindepth 1 -maxdepth 3 | while read -r dir; do
    echo "Processing files in directory: $dir"
    
    # Call the replace_spaces function for each subdirectory
    replace_spaces "$dir"
done

echo "Removing spaces complete!"

