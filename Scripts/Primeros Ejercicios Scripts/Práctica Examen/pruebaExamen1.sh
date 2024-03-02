#!/bin/bash

function fichero {
    menu="a"
    archivo="$1"

    echo "a. Buscar una palabra dentro del archivo"
    echo "b. Mostrar el contenido del fichero"
    echo "c. Salir del Programa"
    read -p "Opción: " menu

    case $menu in
        a)
        read -p "Palabra a buscar: " palabra
        grep "$palabra" "$archivo"
        ;;
        b)
        cat "$archivo"
        ;;
        c)
        echo "Hasta luego"
        exit 0
        ;;
        *)
        echo "Opción no disponible"
        ;;
    esac
}

function directorio {
    menu="a"
    directorio="$1"

    echo "a. Buscar un archivo dentro del directorio"
    echo "b. Ordenar de forma inversa"
    echo "c. Salir del Programa"
    read -p "Opción: " menu

    case $menu in
        a)
        read -p "Archivo a buscar dentro de la carpeta: " archivo
        find "$directorio" -type f -name "$archivo"
        ;;
        b)
        ls -r "$directorio"
        ;;
        c)
        echo "Hasta luego"
        exit 0
        ;;
        *)
        echo "Opción no disponible"
        ;;
    esac
}


#resultado=$(find "$directorio" -type f -name "$nombre_archivo")

#    if [ -n "$resultado" ]; then
#Otra forma de usar el find


if [ $# -eq 0 ];then
    read -p "Pasa un parámetro: " parametro
else 
    parametro=$1
fi
if [[ $parametro =~ ^[0-9]+$ ]];then
    echo "El parámetro pasado es número"
    exit 1
fi

if [ -f $parametro ];then
    fichero "$parametro"
elif [ -d $parametro ];then
    directorio "$parametro"
else
    echo "El parámetro introducido no es ni archivo ni directorio"
    echo "$parametro" >> noficheros.dat
fi