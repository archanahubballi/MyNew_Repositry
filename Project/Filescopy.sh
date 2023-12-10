#!/bin/bash

##########################
# Author: Archana Hubballi
# Date: 10-12-2023
# This script copy all the audio files from different folders to destination folder
# Version: v1

#########################

# Enable the globstar option to enable recursive matching with **

# Specify the root directory where your audio files are located
#root_directory="C:/Users/Archana.c/Downloads/2023-20231205T024847Z-001/2023-20231205T024847Z-001/12-04-2023/*/*/*.mp4"

# Print the list of files that would be copied
echo "Files to be copied:"
find C:/Users/Archana.c/Downloads/2023-20231205T024847Z-001/2023-20231205T024847Z-001/12-04-2023 -type f \( -name "*.mp4" -o -name "*.wav" \)


destination_directory="D:/SQUARE_Trade/SQT_U-Assist_Related_Docs/U-assist calls/New folder"

# Find all audio files and download them
find C:/Users/Archana.c/Downloads/2023-20231205T024847Z-001/2023-20231205T024847Z-001/12-04-2023/*/*/*.mp4 -type f \( -name "*.mp4" -o -name "*.wav" \) -exec mv {} "$destination_directory" \;

# Print the contents of the destination directory
echo "Destination directory contents after copy:"
ls "$destination_directory"

