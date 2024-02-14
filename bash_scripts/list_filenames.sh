#!/bin/bash

# Script to list all files in the a folder and its subfolders
# Save the list to a text file

# Specify the target folder
target_folder="/path/to/target/folder"

# Specify the output text file
output_file="_file_list.txt"

# Change to the target folder
cd "$target_folder" || exit

# List only filenames and extensions, excluding the output file, save to the text file
find . -type f -not -name "${output_file}" -not -name ".DS_Store" -exec basename {} \; | sort > "$output_file"


echo "File list generated and saved to: $output_file"