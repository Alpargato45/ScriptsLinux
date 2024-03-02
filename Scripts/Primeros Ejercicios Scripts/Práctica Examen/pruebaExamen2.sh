#!/bin/bash

if [ $# -eq 0 ];then
    read -p "Pasa un número: " num1
    read -p "Pasa otro número: " num2
elif [ $# -eq 1 ];then
    num1=$1
    read -p "Pasa otro número: " num2
else 
    num1=$1
    num2=$2
fi

menor=0
mayor=0

if [ $num1 -le $num2 ];then
    menor=$num1
    mayor=$num2
else
    menor=$num2
    mayor=$num1
fi

menu="a"

while [ "$menu" != "d" ];do
    echo "a) Factorial"
    echo "b) Suma cubos"
    echo "c) Secuencia"
    echo "d) Salir"
    read -p "Opción: " menu

    case $menu in
        a)
        suma=1
        for ((i=$menor; i>0; i--)); do
            suma=$(($suma*$i))
        done
        echo "El factorial de $menor es: $suma"
        ;;
        b)
        suma=$((($num1*$num1*$num1) + ($num2*$num2)))
        echo "La suma es: $suma"
        ;;
        c)
        for ((i=$menor; i<=$mayor;i++));do
        echo "$i"
        done
        ;;
        d)
        echo "Hasta Luego"
        exit 0
        ;;
        *)
        echo "Opción no válida"
        ;;
    esac
done