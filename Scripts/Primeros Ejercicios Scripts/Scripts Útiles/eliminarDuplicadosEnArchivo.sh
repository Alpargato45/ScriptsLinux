#!/bin/bash

remove_duplicates() {
    local file=$1
    sort -u "$file" > "$file.tmp"
    mv "$file.tmp" "$file"
    echo "Duplicados eliminados en $file."
}