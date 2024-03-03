#!/bin/bash

echo "Menú Principal"
echo "1. Búsqueda"
echo "2. Potencia"
echo "3. Salir"
read -p "Seleccione una opción: " opcion

case $opcion in
    1)
        read -p "Introduzca la cadena a buscar: " cadena
        read -p "Introduzca la ruta del directorio o fichero: " ruta
        if [ -f "$ruta" ]; then
            echo "La cadena '$cadena' se encuentra en el fichero $ruta."
            cat "$ruta" | grep "$cadena"
        elif [ -d "$ruta" ]; then
            echo "La cadena '$cadena' se encuentra en los ficheros dentro del directorio $ruta."
            grep -r "$cadena" "$ruta"
        else
            echo "La ruta introducida no es válida."
        fi
        ;;
    2)
        read -p "Introduzca la base: " base
        read -p "Introduzca el exponente: " exponente
        resultado=$((base ** exponente))
        echo "El resultado de $base elevado a la $exponente es: $resultado"
        ;;
    3)
        echo "Saliendo del programa."
        ;;
    *)
        echo "Opción no válida."
        ;;
esac