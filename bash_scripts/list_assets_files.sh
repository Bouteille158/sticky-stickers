#!/bin/bash

# Script to list all files in the assets folder and its subfolders
# Save the list to a text file

# Usage:
# 1. Open Terminal
# 2. Run the script:
#    bash /path/to/list_assets_files.sh
# 3. The script will generate a text file with the list of files in the assets folder and its subfolders
#    The file will be named 'cached-files-list.txt' and saved to the root folder

# Specify the target folder
target_folder="./assets/"

# Specify the output text file
output_file="../cached-files-list.txt"

# Rename the previous cached-files-list.txt file to old.cached-files-list-timestamp.txt
if [ -f "$output_file" ]; then
    echo "Renaming previous file list to old.cached-files-list-$(date +%s).txt"
    mv "$output_file" "old.cached-files-list-$(date +%s).txt"
fi

# Change to the target folder
cd "$target_folder" || exit

# List all files in the folder and its subfolders, save to the text file
find . -type f -not -name "${output_file}" -not -name ".DS_Store" | sed 's|^\./|./assets/|' | sort > "$output_file"

echo "File list generated and saved to: $output_file"
