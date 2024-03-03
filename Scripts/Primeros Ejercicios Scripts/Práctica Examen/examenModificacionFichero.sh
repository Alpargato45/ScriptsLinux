#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Debe proporcionar un único parámetro (nombre de fichero)."
    exit 1
fi

fichero=$1

if [ ! -e "$fichero" ]; then
    read -p "El fichero no existe. Se creará uno nuevo. Introduzca el comando para crear el fichero: " comando
    eval "$comando" > "$fichero"
fi

intentos=0
while [ $intentos -lt 3 ]; do
    echo "Menú"
    echo "a) Superior"
    echo "b) Inferior"
    echo "c) Intermedias"
    echo "d) Salir"
    read -p "Elija una opción: " opcion

    case $opcion in
        a)
            read -p "Número de filas a eliminar de la parte superior: " num_filas_sup
            tail -n +$((num_filas_sup + 1)) "$fichero" > "$fichero.tmp"
            mv "$fichero.tmp" "$fichero"
            echo "Se eliminaron $num_filas_sup filas de la parte superior."
            ;;
        b)
            read -p "Número de filas a eliminar de la parte inferior: " num_filas_inf
            head -n -$num_filas_inf "$fichero" > "$fichero.tmp"
            mv "$fichero.tmp" "$fichero"
            echo "Se eliminaron $num_filas_inf filas de la parte inferior."
            ;;
        c)
            read -p "Número de filas a eliminar de la parte superior: " num_filas_sup
            read -p "Número de filas a eliminar de la parte inferior: " num_filas_inf
            tail -n +$((num_filas_sup + 1)) "$fichero" | head -n -$num_filas_inf > "$fichero.tmp"
            mv "$fichero.tmp" "$fichero"
            echo "Se eliminaron $num_filas_sup filas de la parte superior y $num_filas_inf filas de la parte inferior."
            ;;
        d)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac

    intentos=$((intentos + 1))
done

echo "Demasiados intentos. Saliendo del programa."