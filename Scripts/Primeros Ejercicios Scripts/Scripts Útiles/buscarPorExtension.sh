#!/bin/bash

find_files_by_extension() {
    local directory=$1
    local extension=$2
    find "$directory" -type f -name "*.$extension"
}