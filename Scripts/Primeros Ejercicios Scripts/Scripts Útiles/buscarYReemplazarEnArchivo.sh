#!/bin/bash

buscar_reemplazar() {
    local file=$1
    local search=$2
    local replace=$3
    sed -i "s/$search/$replace/g" "$file"
    echo "Reemplazado '$search' con '$replace' en $file."
}