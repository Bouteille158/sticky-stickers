#!/bin/bash

# Script to list all files in the assets folder and its subfolders
# Save the list to a text file

# Specify the target folder
target_folder="/path/to/assets/folder"

# Specify the output text file
output_file="assets_file_list.txt"

# Change to the target folder
cd "$target_folder" || exit

# List all files in the folder and its subfolders, save to the text file
find . -type f -not -name "${output_file}" -not -name ".DS_Store" | sed 's|^\./|/assets/|' > "$output_file"

echo "File list generated and saved to: $output_file"
