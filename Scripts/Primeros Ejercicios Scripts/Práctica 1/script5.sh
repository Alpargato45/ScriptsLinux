#!/bin/bash
#5. Realizar un script que permita copiar un archivo en un directorio cualquiera; antes de esto
#preguntar si el archivo se puede leer.

read -p "Archivo que deseas copiar: " archivo

if [ ! -f "$archivo" ];then #-f significa si un ARCHIVO existe
    echo "No se ha encontrado el archivo"
    exit 1
fi

if [ ! -r "$archivo" ];then #Con -r veo si el archivo tiene permisos de lectura
    echo "El archivo no tiene permisos de escritura"
    exit 1
fi

read -p "Directorio donde deseas que se copie el archivo: " directorio

if [ ! -d "$directorio" ];then
    echo "No existe ese directorio"
    exit 1
fi

cp "$archivo" "$directorio"
echo "Archivo copiado con éxito"