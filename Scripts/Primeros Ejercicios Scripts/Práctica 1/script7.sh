#!/bin/bash
#7. Hacer un script que visualice un menú de 3 opciones: la primera opción es borrar un
#fichero, la segunda opción es imprimirlo y la tercera opción es salir. El nombre del fichero lo
#introduciremos desde teclado.

menu=0

while [ menu != 3 ];do
    echo "1. Borrar un Fichero"
    echo "2. Imprimir un Fichero"
    echo "3. Salir"
    
    read -p "Opción: " menu

    case $menu in 
        1)
        read -p "Fichero a borrar: " fichero
        if [ ! -f $fichero ];then
            echo "No se ha encontrado el fichero $fichero"
            exit 1
        fi
        rm -r "$fichero"
        echo "Fichero eliminado."
        ;;
        2)
        read -p "Fichero a imprimir: " fichero
        if [ ! -f $fichero ];then
            echo "No se ha encontrado el fichero $fichero"
            exit 1
        fi
        cat "$fichero"
        ;;
        3)
        echo "Adiós"
        exit 0
        ;;
        *)
        echo "Lo siento, introduce un número del 1 al 3"
    esac
done