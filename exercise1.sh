#!/bin/bash

# Create directories if they don't exist
mkdir -p deployPackage/added
mkdir -p deployPackage/removed

# Read the file_diff.txt line by line
while IFS= read -r line; do
    status=$(echo "$line" | awk '{print $1}')
    filename=$(echo "$line" | awk '{print $2}')
    
    # Capture file names with status M or A
    if [[ $status == "M" || $status == "A" ]]; then
        echo "$(basename "$filename")" >> added.txt
        cp "$filename" deployPackage/added
    fi
    
    # Capture file names with status R or D
    if [[ $status == "R" || $status == "D" ]]; then
        echo "$(basename "$filename")" >> removed.txt
        cp "$filename" deployPackage/removed
    fi
done < file_diff.txt