#!/bin/bash
#6. Hacer un script que compare dos cadenas introducidas como parámetros y visualice el
#mensaje correspondiente; previamente comparar que el número de parámetros es correcto.

if [ $# != 2 ];then
    echo "Error, al introducir parámetros. Deben ser 2"
    exit 1
fi

if [ "$1" == "$2" ];then
    echo "Las dos cadenas son iguales"
else 
    echo "Las dos cadenas no son iguales"
fi