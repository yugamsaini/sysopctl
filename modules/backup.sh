#!/bin/bash

# Function to backup system files
perform_backup() {
    SOURCE_PATH="$1"
    
    if [[ -z "$SOURCE_PATH" ]]; then
        echo "Error: No path provided. Please specify a directory to backup."
        exit 1
    fi
    
    if [[ ! -d "$SOURCE_PATH" ]]; then
        echo "Error: The specified path does not exist: $SOURCE_PATH"
        exit 1
    fi
    
    DEST_DIR="/backup_$(date +%Y%m%d_%H%M%S)"
    echo "Starting backup of $SOURCE_PATH to $DEST_DIR"
    
    sudo mkdir -p "$DEST_DIR"
    
    sudo rsync -avh --progress "$SOURCE_PATH" "$DEST_DIR"
    
    echo "Backup completed successfully for: $SOURCE_PATH"
}
