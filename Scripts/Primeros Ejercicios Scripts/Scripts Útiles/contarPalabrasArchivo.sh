#!/bin/bash

count_words() {
    local file=$1
    local words=$(wc -w < "$file")
    echo "El archivo $file tiene $words palabras."
}