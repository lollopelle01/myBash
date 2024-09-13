#!/bin/bash

# Check if a directory is provided as a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"

# Check if the provided path is a directory
if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' is not a directory."
    exit 1
fi

find "$DIR" -name "._*" -exec rm -f {} \;
