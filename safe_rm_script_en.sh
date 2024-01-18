#!/bin/bash

# Define the trash directory path and the maximum age for files to be kept
CORBEILLE=~/TRASH_RM
AGE_MAX=30

# Create the trash directory if it does not exist
mkdir -p "$CORBEILLE"  # mkdir -p creates the directory if it doesn't already exist

# Function to move files/folders to the trash
safe_rm() {
    for path in "$@"; do  # Iterate over all arguments passed to the function
        base=$(basename "$path")  # Extract the base name of the file/folder
        dest="$CORBEILLE/$base"  # Define the destination path in the trash
        i=1  # Initialize a counter for duplicate names
        while [ -e "$dest" ]; do  # Loop as long as a file/folder with the same name exists
            dest="$CORBEILLE/$base($i)"  # Add an index to the name to avoid duplicates
            i=$((i + 1))  # Increment the index
        done
        mv "$path" "$dest"  # Move the file/folder to the trash
    done
}

# Function to clean up the trash
clean_corbeille() {
    find "$CORBEILLE" -type f -mtime +$AGE_MAX -delete  # Delete files older than AGE_MAX
    find "$CORBEILLE" -type d -empty -delete  # Delete empty directories
}

# Replace the rm command
if [ "$1" = "--clean" ]; then  # If the first argument is --clean
    clean_corbeille  # Call the clean-up function
else
    safe_rm "$@"  # Otherwise, call the safe_rm function with all arguments passed to the script
fi
