#!/bin/bash
#14. Realizar un script que utilice un menú con 4 opciones:
#a. Buscar un archivo.
#b. Cambiar los permisos de un archivo.
#c. Buscar una cadena en un archivo.
#d. Salir del menú.

menu="m"

while [ "$menu" != "d" ];do
    echo "a. Buscar un archivo"
    echo "b. Cambiar permisos de un archivo"
    echo "c. Buscar una cadena en un archivo"
    echo "d. Salir del menú"
    read -p "Opción: " menu
    case $menu in
        a)
        read -p "Ingrese el nombre del archivo a buscar: " archivo
        if [ -e "$archivo" ];then
            echo "El archivo $archivo existe"
        else 
            echo "El archivo $archivo no existe"
        fi
        ;;
        b)
        read -p "Ingrese el nombre del archivo a buscar: " archivo
        chmod 777 "$archivo"
        ;;
        c)
        read -p "Ingrese el nombre del archivo a buscar: " archivo
        read -p "Cadena a buscar dentro del archivo: " cadena
        grep "$cadena" "$archivo"
        ;;
        d)
        echo "Hasta Luego"
        exit 0
        ;;
    esac
done