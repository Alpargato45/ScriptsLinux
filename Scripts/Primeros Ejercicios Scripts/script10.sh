#!/bin/bash
#10. Realizar un script que simule a la orden cp (copiar un fichero en otro). En este script,
#pasamos dos parámetros que son dos ficheros, con el primer parámetro preguntamos si es
#de lectura y en el segundo parámetro preguntar si existe y es de escritura, en cuyo caso
#debemos pedir confirmación antes de sobrescribir el fichero.

if [ $# != 2 ];then
    echo "Se necesitan dos parámetros"
    exit 1
fi
if [ ! -r $1 ];then
    echo "El primer archivo no tiene permisos de lectura"
    exit 1
fi
if [ ! -f $2 ];then
    echo "El segundo archivo no existe"
    exit 1
fi
if [ ! -w $2 ];then
    echo "El segundo archivo no tiene permisos de escritura"
    exit 1
fi

read -p "¿Seguro que desea sobreescribir el archivo $2 (s/n)?" confirmacion

if [ "$confirmacion" == "s" ];then
    cat $1 > "$2"
    echo "Archivo sobreescrito"
else
    exit 0
fi