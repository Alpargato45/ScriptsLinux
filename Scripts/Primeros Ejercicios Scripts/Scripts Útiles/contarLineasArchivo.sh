#!/bin/bash

contar_lineas() {
    local file=$1
    local lines=$(wc -l < "$file")
    echo "El archivo $file tiene $lines líneas."
}

read -p "Archivo: " archivo
contar_lineas $archivo