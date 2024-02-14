#!/bin/bash
## Moving the current working directory for local sources
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )
cd "$parent_path" || exit

# Create a new folder for the assets
mkdir -p assets/default
touch assets/default/default-image.png

# Launch the script to generate lists-list.txt file 
# with the list of files in the assets folder and its subfolders
bash ./bash_scripts/list_filenames.sh

# Launch the script to generate cached-files-list.txt file
# with the list of files in the assets folder and its subfolders
bash ./bash_scripts/list_assets_files.sh