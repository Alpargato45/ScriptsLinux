#!/bin/bash
#9. Realizar un script que visualice si un usuario pasado como parámetro está conectado a la red o no.

if [ $# -eq 0 ]; then
    echo "Error: Proporcione un nombre de usuario como parámetro."
    exit 1
fi

usuario=$1 #Se podria usar directamente $1 en vez de guardarlo en una variable
if who | grep -q "$usuario"; then
    echo "El usuario $usuario está conectado a la red."
else
    echo "El usuario $usuario no está conectado a la red."
fi