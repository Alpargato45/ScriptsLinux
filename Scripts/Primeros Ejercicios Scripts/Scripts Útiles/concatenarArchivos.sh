#!/bin/bash

concatenate_files() {
    local output_file=$1
    shift
    cat "$@" > "$output_file"
    echo "Archivos concatenados en $output_file."
}