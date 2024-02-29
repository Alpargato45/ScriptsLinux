#!/bin/bash
#12. Crear un script que acepte un número indefinido de parámetros (ficheros) y con estos
#parámetros preguntar si existen cada uno de esos ficheros, en caso de existir, se imprimen
#y al final de todo el proceso almacenar en un fichero los nombres de los ficheros que se
#han podido imprimir y en otro fichero los nombres de los ficheros que no se han podido
#imprimir, para después enviar un e-mail al usuario, diciendo qué ficheros se han podido imprimir y cuales no.
#(no es necessario enviarlo por correo)

if [ $# == 0 ];then
    echo "Se necesita al menos un parámetro"
    exit 1
fi

#for ((i=1;i<=$#;i++));do
#    echo "$i"
#done !! Había pensado algo asi al principio pero esto solo me da el número de la i 
#Es mejor con un bucle "for each"

imprimir="archivoImprimir.txt"
noImprimir="archivoNoImprimir.txt"

for archivo in "$@"; do #Al contrario que $# que me da los números, $@ me da los parámetros
    if [ -e "$archivo" ];then
        echo "El archivo $archivo existe."
        cat "$archivo"
        echo "$archivo" >> "$imprimir" #No se usa el cat, porque queremos poner el nombre del fichero
        #no lo que contiene dentro
    else
        echo "El archivo $archivo no existe."
        echo "$archivo" >> "$noImprimir"
    fi
done