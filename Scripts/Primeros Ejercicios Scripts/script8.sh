#!/bin/bash
#8. Realizar un script que acepta un argumento, pregunta si ese fichero existe y es de lectura,
#en cuyo caso visualiza su contenido o presenta un error en caso contrario.

if [ $# != 1 ];then
    echo "Tienes que introducir 1 parámetro"
    exit 1
fi
if [ ! -f $1 ];then
    echo "El archivo seleccionado no existe"
    exit 1
fi
if [ ! -r $1 ];then
    echo "El archivo no tiene permisos de lectura"
    exit 1
fi
cat "$1"