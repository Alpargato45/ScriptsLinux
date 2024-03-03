#!/bin/bash

count_files_in_directory() {
    local directory=$1
    local file_count=$(find "$directory" -type f | wc -l)
    echo "Número de archivos en $directory: $file_count"
}