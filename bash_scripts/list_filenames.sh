#!/bin/bash

# Script to list all assets files in the a folder and its subfolders
# Save the list to a text file

# Usage:
# 1. Open Terminal
# 2. Run the script:
#    bash /path/to/list_filenames.sh
#
# Note: Replace '/path/to/list_filenames.sh' with the actual path to the script.

# Specify the target folder
target_folder="assets/*"

# Rename the previous list-list.txt file to old.list-list-timestamp.txt
if [ -f "lists-list.txt" ]; then
    echo "Renaming previous file list to old.lists-list-$(date +%s).txt"
    mv "lists-list.txt" "old.lists-list-$(date +%s).txt"
fi

# For each folder in the assets folder, run the script
for folder in $target_folder
do
    echo "Processing folder: $folder"

    # Specify the output text file
    output_file="_file_list.txt"

    # Change to the target folder
    cd "$folder" || exit

    # List only filenames and extensions, excluding the output file, save to the text file
    find . -type f -not -name "${output_file}" -not -name ".DS_Store" -exec basename {} \; | sort > "$output_file"
  
    echo "./$folder/$output_file" >> ../../lists-list.txt

    echo "File list generated and saved to: $output_file"

    # Go back to the root folder
    cd ../..
done