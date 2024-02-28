#!/bin/bash
#3. Realizar un script que nos muestre cuál es el fichero de mayor tamaño de un directorio que
#se introducirá por teclado.

read -p "Introduzca el directorio en el que quieres buscar: " directorio

if [ ! -d "$directorio" ];then #-d significa si un DIRECTORIO existe
    echo "El directorio no existe."
    exit 1 #Significa que acaba el programa de forma no exitosa
           #En este caso si no encuentra el directorio acaba el script
fi

archivo=$(find "$directorio" -type f -exec du -h {} + | sort -rh | head -n 1)
echo "El archivo más grande encontrado en el directorio $directorio es: $archivo"