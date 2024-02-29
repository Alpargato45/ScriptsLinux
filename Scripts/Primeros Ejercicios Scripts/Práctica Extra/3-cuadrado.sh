#!/bin/bash
#3. Crea un script llamado cuadrado, que al llamarlo tengamos que ponerle un
#parámetro numérico y nos devuelva su cuadrado

if [ $# -eq 0 ];then
    echo "Tienes que pasar 1 parámetro"
    exit 1
fi

cuadrado=$(($1 * $1))

echo "El cuadrado de $1 es $cuadrado"