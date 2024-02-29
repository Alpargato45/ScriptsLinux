#!/bin/bash
#1. Crea un script llamado media, que al llamarlo tengamos que ponerle tres parámetros
#numéricos y nos devuelva la media aritmética de esos valores. Es decir, si ponemos
#media 24 56 42 nos debe presentar el número 40.666

if [ $# != 3 ];then
    echo "Se necesitan 3 parámetros"
    exit 1
fi

resultado=$((($1+$2+$3)/3)) #Cuando trabajas con operaciones es necesario doble paréntesis
#y tambien igualar a una variable ej: resultado=$
#Los dos paréntesis es sin contemplar la opción de decimales
resultado=$(echo "scale=2; ($1 + $2 + $3) / 3" | bc) #así sería con decimales
#scale le dice a bc cuantos decimales quiere
echo "La media de $1, $2 y $3 es $resultado"